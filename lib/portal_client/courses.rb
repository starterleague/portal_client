module PortalClient
  module Courses
    def courses(options = {})
      get("/courses", options)
    end

    def course(id, options = {})
      get("/courses/#{id}", options)
    end

    def enrollments(course_id, options = {})
      get("/courses/#{course_id}/enrollments", options)
    end
  end
end
