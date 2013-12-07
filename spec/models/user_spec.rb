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
end
