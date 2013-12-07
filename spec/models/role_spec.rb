require 'spec_helper'

describe Role do
  describe "concerning validations" do
    it "should have a valid factory" do
      build(:role).should be_valid
    end

    it "should require a name" do
      build(:role, name: nil).should_not be_valid
    end

    it "should require a key" do
      build(:role, key: nil).should_not be_valid
    end

    it "should require a unique name" do
      create(:role, name: "Administrator").should be_valid
      build(:role, name: "Administrator").should_not be_valid
    end

    it "should require a unique name regardless of case" do
      create(:role, name: "administrator").should be_valid
      build(:role, name: "ADMINISTRATOR").should_not be_valid
    end

    it "should require a unique key" do
      create(:role, key: "Administrator").should be_valid
      build(:role, key: "Administrator").should_not be_valid
    end

    it "should require a unique key regardless of case" do
      create(:role, key: "administrator").should be_valid
      build(:role, key: "ADMINISTRATOR").should_not be_valid
    end
  end
end
