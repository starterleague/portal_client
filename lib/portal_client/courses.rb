module PortalClient
  module Courses
    def courses(options = {})
      get("/courses", options)
    end

    def course(id, options = {})
      get("/courses/#{id}", options)
    end
  end
end
