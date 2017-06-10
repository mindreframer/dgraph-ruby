module Dgraph
  module Sand
    # Controller is responsible for starting / stopping Dgraph server
    class Controller
      def start
      end

      def stop
      end

      def binary_path
        config.root.join("tmp/dgraph/dgraph").to_s
      end

      def config
        Dgraph::Config.instance
      end
    end
  end
end
