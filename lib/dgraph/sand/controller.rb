module Dgraph
  module Sand
    # Controller is responsible for starting / stopping Dgraph server
    class Controller
      attr_accessor :server_pid
      def start
        in_data do
          @server_pid = Kernel.spawn(binary_path)
        end
      end

      def stop
        ::Process.kill('SIGTERM', server_pid)
      end

      private

      def in_data(&block)
        ensure_data!
        old_folder = Dir.pwd
        Dir.chdir(datafolder)
        block.call
        Dir.chdir(old_folder)
      end

      def config
        Dgraph::Config.instance
      end

      def ensure_data!
        FileUtils.mkdir_p(datafolder)
      end

      def binary_path
        tmpfolder.join("dgraph/dgraph").to_s
      end

      def datafolder
        tmpfolder.join("data")
      end

      def tmpfolder
        config.root.join("tmp")
      end
    end
  end
end
