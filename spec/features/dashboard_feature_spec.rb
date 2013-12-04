require 'spec_helper'

describe "Dashboard" do

  describe "viewing the dashboard" do
    it "should work right" do
      visit root_path
      page.should have_selector('h3', text: "My Dashboard")
    end
  end

end
