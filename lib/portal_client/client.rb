module PortalClient
  class Client
    include PortalClient::Request
    include PortalClient::Courses
    include PortalClient::Users

    def initialize(access_token)
      @client = OAuth2::AccessToken.new(PortalClient.config.oauth_client, access_token)
    end

  end
end
