module Dgraph
  class Client
    def query(q)
      deal_with_response(http.post(q_url, q))
    end

    private
    NO_CONNECTION_BODY = "{\"code\":\"Error\",\"message\":\"No connection exists\"}"

    def deal_with_response(resp)
      if resp.headers["Content-Type"]
        return JSON.parse(resp.body)
      end

      if resp.body == NO_CONNECTION_BODY
        return JSON.parse(res.body)
      end
    end

    def q_url
      File.join(config.server_url, "query")
    end

    def http
      config.http
    end

    def config
      Dgraph::Config.instance
    end
  end
end
