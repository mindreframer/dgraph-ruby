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

    def http
       HTTPClient.new
    end

    def server_url # default
      "http://localhost:8080"
    end
  end
end