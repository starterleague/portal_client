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
        
      if PortalClient.caching?
        options[:cache] ||= {}
        cache_options = options.delete(:cache)
        cache_options.reverse_merge!({:expires_in => 1.day})

        key = [URI(request_path).path, options]

        PortalClient.config.cache_store.fetch(key, cache_options) do
          get_response(method, request_path, options)
        end
      else
        get_response(method, request_path, options)
      end
    end

    def response_to_mash(response)
      if response.status == 200
        Hashie::Mash.new(JSON.parse(response.body))
      else
        Hashie::Mash.new {}
      end
    end

    def get_response(method, path, options = {})
      response_to_mash(@client.request(method, path, options))
    end
  end
end
