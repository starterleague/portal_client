require File.dirname(__FILE__) + '/spec_helper'

describe "Quarters" do
  before do
    configure_portal_client
    @client = PortalClient::Client.new(TEST_ACCESS_TOKEN)
  end

  describe "#quarters" do
    it "returns an array of quarter objects" do
      data = @client.quarters
      data.quarters.items.class.should be(Array)
      data.quarters.should include('total','items')
    end
  end

  describe "#quarter" do
    it "returns a properly formatted quarter object" do
      quarter = @client.quarter(2)
      quarter.keys.should include(
        'id',
        'name',
        'season',
        'starts_on',
        'ends_on',
        'courses'
      )
      quarter.courses.class.should be(Array)
    end
  end
end
