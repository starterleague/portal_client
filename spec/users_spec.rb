require File.dirname(__FILE__) + '/spec_helper'

describe "Users" do
  before do
    configure_portal_client
    @client = PortalClient::Client.new(TEST_ACCESS_TOKEN)
  end

  describe "#current_user" do
    it "returns a property formatted user object" do
      user = @client.current_user
      user.keys.should include(
        'id',
        'email',
        'first_name',
        'last_name',
        'twitter',
        'github',
        'blog',
        'avatar',
        'courses'
      )
      user.courses.class.should be(Array)
    end
  end
end
