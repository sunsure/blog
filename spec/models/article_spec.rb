require 'spec_helper'

describe Article do
  describe "concerning validations" do
    it "should have a valid factory" do
      build(:article).should be_valid
    end
  end
end
