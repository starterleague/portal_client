module PortalClient
  module Users
    def current_user(options = {})
      options.merge!({ :cache => {:expires_in => 10.minutes} })
      get("/users/current_user", options)
    end
  end
end
