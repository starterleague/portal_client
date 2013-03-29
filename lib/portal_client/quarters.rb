module PortalClient
  module Quarters
    def quarters(options = {})
      get("/quarters", options)
    end

    def quarter(quarter_id, options = {})
      get("/quarters/#{quarter_id}", options)
    end
  end
end
