module PortalClient
  class << self
    attr_accessor :configuration

    def config
      self.configuration ||= PortalClient::Configuration.new
    end

    def reset_configuration
      self.configuration = PortalClient::Configuration.new
    end

    def caching?
      store = self.config.cache_store

      store &&
        store.respond_to?(:fetch) &&
        store.respond_to?(:read) &&
        store.respond_to?(:write)
    end

    def configure
      yield(config)
    end
  end
end

module PortalClient
  class Configuration
    attr_accessor :app_id, :secret, :base_uri, :oauth_client, :cache_store

    def base_uri
      @base_uri || 'http://portal.starterleague.com/api/v1'
    end

    def oauth_client
      @oauth_client || OAuth2::Client.new(@app_id, @secret)
    end

  end
end
