require File.dirname(__FILE__) + '/spec_helper'

describe "Years" do
  before do
    configure_portal_client
    @client = PortalClient::Client.new(TEST_ACCESS_TOKEN)
  end

  describe "#years" do
    it "returns an array of year objects" do
      data = @client.years
      data.years.items.class.should be(Array)
      data.years.should include('total','items')
    end
  end

  describe "#year" do
    it "returns a properly formatted year object" do
      year = @client.year(2011)
      year.keys.should include(
        'year',
        'total_students',
        'total_courses',
        'quarters'
      )
      year.quarters.class.should be(Array)
    end
  end
end
