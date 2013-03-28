module PortalClient
  module Users
    def current_user(options = {})
      get("/users/current_user", options)
    end
  end
end
