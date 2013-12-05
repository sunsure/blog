require 'spec_helper'

describe "Dashboard" do

  describe "viewing the dashboard" do
    it "should work right" do
      visit dashboard_path
      page.should have_selector('h3', text: "My Dashboard")
    end
  end

end
