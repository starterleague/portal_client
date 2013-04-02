$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'dotenv'
require 'portal_client'
Dotenv.load

def configure_portal_client
  PortalClient.configure do |config|
    # use your real credentials when rebuilding VCR cassettes
    config.app_id = ENV['PORTAL_APP_ID']
    config.secret = ENV['PORTAL_SECRET']
  end
end

TEST_ACCESS_TOKEN = ENV['PORTAL_ACCESS_TOKEN']
