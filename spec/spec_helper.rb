$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'portal_client'

def configure_portal_client
  PortalClient.configure do |config|
    # use your real credentials when rebuilding VCR cassettes
    config.client_id = 'replace_with_your_client_id'
    config.client_secret = 'replace_with_your_client_secret'
  end
end

TEST_ACCESS_TOKEN = 'replace_with_your_access_token'
