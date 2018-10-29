{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving         #-}
{-# LANGUAGE UndecidableInstances       #-}

-- | Mock implementations of verifiable random functions.
module Infra.Crypto.Mock.VRF
  ( VerKeyVRF
  , SignKeyVRF
  , genKeyPairVRF
  , deriveVerKeyVRF
  , CertVRF
  , CertifiedVRF
  , evalVRF
  , verCertifiedVRF
  , VerErrorVRF (..)
  ) where

import           Control.Monad.Except
import           Crypto.Random (MonadRandom)
import           GHC.Generics (Generic)
import           GHC.Stack
import           Numeric.Natural

import           Infra.Crypto.Hash
import           Infra.Util
import           Infra.Util.HList
import           Serialise

newtype VerKeyVRF = VerKeyVRF Int
    deriving (Show, Eq, Ord, Generic)

instance Condense VerKeyVRF where
  condense (VerKeyVRF sid) = "vk(" ++ condense sid ++ ")"

data SignKeyVRF = SignKeyVRF VerKeyVRF
  deriving (Show, Eq, Ord, Generic)

instance Condense SignKeyVRF where
  condense (SignKeyVRF (VerKeyVRF sid)) = "sk(" ++ condense sid ++ ")"

genKeyPairVRF :: MonadRandom m => Int -> m (VerKeyVRF, SignKeyVRF)
genKeyPairVRF sid = do
    let vk = VerKeyVRF sid
    return (vk, SignKeyVRF vk)

deriveVerKeyVRF :: SignKeyVRF -> VerKeyVRF
deriveVerKeyVRF (SignKeyVRF vk) = vk

data CertVRF a = CertVRF SignKeyVRF a
    deriving (Show, Eq, Ord, Generic)

instance Condense a => Condense (CertVRF a) where
    condense (CertVRF sk a) = condense (sk, a)

newtype CertifiedVRF a = CertifiedVRF (DecoratedWith (CertVRF a) Natural)
    deriving (Show, Eq, Ord, Generic, Decorates Natural, Condense, Serialise)

evalVRF :: Serialise a => a -> SignKeyVRF -> CertifiedVRF a
evalVRF a sk =
    let n      = fromHash $ hash $ a :* sk :* Nil
        cert   = CertVRF sk a
    in  CertifiedVRF (DecoratedWith cert n)

data VerErrorVRF where
    VerErrorVRF :: Show a
                => CallStack
                -> CertifiedVRF a
                -> VerErrorVRF

deriving instance Show VerErrorVRF

verCertifiedVRF :: (Monad m, HasCallStack, Show a, Eq a)
                => VerKeyVRF
                -> a
                -> CertifiedVRF a
                -> ExceptT VerErrorVRF m ()
verCertifiedVRF vk a c@(CertifiedVRF y)
    | deriveVerKeyVRF sk == vk && a' == a = return ()
    | otherwise = throwError $ VerErrorVRF callStack c
  where
    CertVRF sk a' = decoration y


instance Serialise VerKeyVRF
instance Serialise SignKeyVRF
instance Serialise a => Serialise (CertVRF a)
