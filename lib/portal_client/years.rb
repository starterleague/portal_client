module PortalClient
  module Years
    def years(options = {})
      get("/years", options)
    end

    def year(year, options = {})
      get("/years/#{year}", options)
    end
  end
end
