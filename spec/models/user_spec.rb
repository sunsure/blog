require 'spec_helper'

describe User do
  describe "concerning validations" do
    it "should have a valid factory" do
      build(:user).should be_valid
    end
  end

  describe "concerning relations" do
    it "should allow a user to have many roles" do
      role = create(:role, name: "Admin")
      user = create(:user)
      power = create(:power, role: role, user: user)
      user.powers.should include(power)
      user.roles.should include(role)
    end
  end

  describe "concerning instance methods" do
    it "should be able to find out if a user has a role by key" do
      role = create(:role, name: "Admin", key: "admin")
      user = create(:user)
      power = create(:power, role: role, user: user)
      user.is?(:admin).should eq(true)
      user.is?(:stupid).should eq(false)
    end
  end
end
