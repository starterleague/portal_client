require File.dirname(__FILE__) + '/spec_helper'
require 'uri'
require 'active_support/cache'

describe "Caching" do
  let(:cache_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
  let(:base_path) { URI(PortalClient.config.base_uri).path }
  let(:client) { PortalClient::Client.new(TEST_ACCESS_TOKEN) }

  before do
    PortalClient.config.cache_store = nil
  end

  describe "#response" do
    it "calls fetch on the cache_store" do
      PortalClient.config.cache_store = cache_store
      cache_store.should_receive(:fetch).with([base_path + '/quarters', {}], anything)
      client.quarters
    end

    it "returns the same hash of options from the cache" do
      uncached = client.quarters

      PortalClient.config.cache_store = cache_store
      client.quarters.should == uncached
    end
  end

  describe "expiry times" do
    before do
      PortalClient.config.cache_store = cache_store
    end
    
    context "by default" do
      it "is set to 1 day" do
        cache_store.should_receive(:fetch).with(anything, {:expires_in => 1.day})
        client.courses
      end
    end
    
    context "for current_user" do
      it "is set to 10 minutes" do
        cache_store.should_receive(:fetch).with(anything, {:expires_in => 10.minutes})
        client.current_user
      end
    end
  end
end
