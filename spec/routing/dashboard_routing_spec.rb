require "spec_helper"

describe DashboardController do
  describe "routing" do
    it "routes to #index" do
      get("/dashboard").should route_to("dashboard#index")
    end
  end
end
