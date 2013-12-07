require 'spec_helper'

describe Power do
  describe "concerning validations" do
    it "should have a valid factory" do
      build(:power).should be_valid
    end
  end
end
