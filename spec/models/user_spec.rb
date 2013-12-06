require 'spec_helper'

describe User do
  describe "concerning validations" do
    it "should have a valid factory" do
      build(:user).should be_valid
    end
  end
end
