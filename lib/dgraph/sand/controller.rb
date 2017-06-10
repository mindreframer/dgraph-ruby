module Dgraph
  module Sand
    # Controller is responsible for starting / stopping Dgraph server
    class Controller
      attr_accessor :server_pids
      attr_accessor :debug

      def initialize(debug: true)
        @debug = debug
      end

      def start
        in_data do
          server_pids << Kernel.spawn(binary_path, spawn_opts)
        end
      end

      def stop(idx=0)
        return unless server_pids[idx]
        ::Process.kill('SIGTERM', server_pids[idx])
        server_pids.delete_at(idx)
      end

      def server_pids
        @server_pids ||= []
      end

      private

      def spawn_opts
        return {} if debug
        return [:out, :err] => "/dev/null" # no output
      end

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
        FileUtils.rm_rf(datafolder)
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
