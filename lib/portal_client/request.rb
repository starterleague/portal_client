module PortalClient
  module Request
    def get(path, options = {})
      response(:get, path, options)
    end

    def post(path, options = {})
      response(:post, path, options)
    end

    def put(path, options = {})
      response(:put, path, options)
    end

    def delete(path, options = {})
      response(:delete, path, options)
    end

    def head(path, options = {})
      response(:head, path, options)
    end

  private

    def response(method, path, options = {})
      request_path = PortalClient.config.base_uri + path
      response_to_mash(@client.request(method, request_path, options))
    end

    def response_to_mash(response)
      if response.status == 200
        Hashie::Mash.new(JSON.parse(response.body))
      else
        Hashie::Mash.new {}
      end
    end
  end
end
