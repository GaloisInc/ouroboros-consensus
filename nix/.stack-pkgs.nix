{
  overlay = hackage:
    {
      packages = {
        "time-units" = (((hackage.time-units)."1.0.0").revisions).default;
        "ekg" = (((hackage.ekg)."0.4.0.15").revisions).default;
        "ekg-json" = (((hackage.ekg-json)."0.1.0.6").revisions).default;
        "process" = (((hackage.process)."1.6.5.0").revisions).default;
        "graphviz" = (((hackage.graphviz)."2999.20.0.3").revisions).default;
        "quickcheck-state-machine" = (((hackage.quickcheck-state-machine)."0.6.0").revisions).default;
        "libyaml" = (((hackage.libyaml)."0.1.0.0").revisions).default;
        "ekg-wai" = (((hackage.ekg-wai)."0.1.0.3").revisions).default;
        "pvss" = (((hackage.pvss)."0.2.0").revisions).default;
        "lrucache" = (((hackage.lrucache)."1.2.0.1").revisions).default;
        "o-clock" = (((hackage.o-clock)."1.0.0.1").revisions).default;
        "yaml" = (((hackage.yaml)."0.8.32").revisions).default;
        "containers" = (((hackage.containers)."0.5.11.0").revisions).default;
        "aeson" = (((hackage.aeson)."1.3.1.1").revisions).default;
        "base58-bytestring" = (((hackage.base58-bytestring)."0.1.0").revisions).default;
        "network" = (((hackage.network)."2.6.3.6").revisions).default;
        "transformers-lift" = (((hackage.transformers-lift)."0.2.0.1").revisions).default;
        "servant" = (((hackage.servant)."0.14.1").revisions).default;
        "servant-client" = (((hackage.servant-client)."0.14").revisions).default;
        "servant-client-core" = (((hackage.servant-client-core)."0.14.1").revisions).default;
        "servant-server" = (((hackage.servant-server)."0.14.1").revisions).default;
        "servant-swagger" = (((hackage.servant-swagger)."1.1.6").revisions).default;
        "free" = (((hackage.free)."5.0.2").revisions).default;
        "generics-sop" = (((hackage.generics-sop)."0.3.2.0").revisions).default;
        "http-api-data" = (((hackage.http-api-data)."0.3.10").revisions).default;
        "swagger2" = (((hackage.swagger2)."2.3.0.1").revisions).default;
        "these" = (((hackage.these)."0.7.5").revisions).default;
        "lzma-clib" = (((hackage.lzma-clib)."5.2.2").revisions).default;
        } // {
        typed-protocols = ./.stack.nix/typed-protocols.nix;
        ouroboros-network = ./.stack.nix/ouroboros-network.nix;
        ouroboros-network-testing = ./.stack.nix/ouroboros-network-testing.nix;
        ouroboros-consensus = ./.stack.nix/ouroboros-consensus.nix;
        io-sim = ./.stack.nix/io-sim.nix;
        io-sim-classes = ./.stack.nix/io-sim-classes.nix;
        byron-proxy = ./.stack.nix/byron-proxy.nix;
        iohk-monitoring = ./.stack.nix/iohk-monitoring.nix;
        basic-tracer = ./.stack.nix/basic-tracer.nix;
        writer-cps-mtl = ./.stack.nix/writer-cps-mtl.nix;
        writer-cps-transformers = ./.stack.nix/writer-cps-transformers.nix;
        canonical-json = ./.stack.nix/canonical-json.nix;
        ether = ./.stack.nix/ether.nix;
        aeson-options = ./.stack.nix/aeson-options.nix;
        serokell-util = ./.stack.nix/serokell-util.nix;
        cardano-crypto = ./.stack.nix/cardano-crypto.nix;
        cardano-report-server = ./.stack.nix/cardano-report-server.nix;
        log-warper = ./.stack.nix/log-warper.nix;
        rocksdb-haskell-ng = ./.stack.nix/rocksdb-haskell-ng.nix;
        kademlia = ./.stack.nix/kademlia.nix;
        network-transport = ./.stack.nix/network-transport.nix;
        network-transport-tcp = ./.stack.nix/network-transport-tcp.nix;
        universum = ./.stack.nix/universum.nix;
        hedgehog = ./.stack.nix/hedgehog.nix;
        cardano-sl = ./.stack.nix/cardano-sl.nix;
        cardano-sl-core = ./.stack.nix/cardano-sl-core.nix;
        cardano-sl-core-test = ./.stack.nix/cardano-sl-core-test.nix;
        cardano-sl-binary = ./.stack.nix/cardano-sl-binary.nix;
        cardano-sl-binary-test = ./.stack.nix/cardano-sl-binary-test.nix;
        cardano-sl-chain = ./.stack.nix/cardano-sl-chain.nix;
        cardano-sl-chain-test = ./.stack.nix/cardano-sl-chain-test.nix;
        cardano-sl-crypto = ./.stack.nix/cardano-sl-crypto.nix;
        cardano-sl-crypto-test = ./.stack.nix/cardano-sl-crypto-test.nix;
        cardano-sl-db = ./.stack.nix/cardano-sl-db.nix;
        cardano-sl-infra = ./.stack.nix/cardano-sl-infra.nix;
        cardano-sl-util = ./.stack.nix/cardano-sl-util.nix;
        cardano-sl-util-test = ./.stack.nix/cardano-sl-util-test.nix;
        cardano-sl-networking = ./.stack.nix/cardano-sl-networking.nix;
        };
      compiler.version = "8.6.3";
      compiler.nix-name = "ghc863";
      };
  resolver = "lts-13.10";
  compiler = "ghc-8.6.3";
  }
