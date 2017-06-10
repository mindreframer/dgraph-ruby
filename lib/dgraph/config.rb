module Dgraph

  class Config
    def self.instance
      @instance ||= self.new
    end

    def root
      str_path = File.expand_path(
        File.join(
          File.dirname(__FILE__),
          "..",
          "..",
        )
      )
      Pathname.new(str_path)
    end
  end
end