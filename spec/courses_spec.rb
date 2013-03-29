require File.dirname(__FILE__) + '/spec_helper'

describe "Courses" do
  before do
    configure_portal_client
    @client = PortalClient::Client.new(TEST_ACCESS_TOKEN)
  end

  describe "#courses" do
    it "returns an array of course objects" do
      data = @client.courses
      data.courses.items.class.should be(Array)
      data.courses.should include('total','items')
    end
  end

  describe "#course" do
    it "returns a properly formatted course object" do
      course = @client.course(2)
      course.keys.should include(
        'id',
        'name',
        'time',
        'location',
        'quarter',
        'starts_on',
        'ends_on'
      )
      course.students.class.should be(Array)
      course.assistants.class.should be(Array)
      course.mentors.class.should be(Array)
      course.instructors.class.should be(Array)
    end
  end
end
