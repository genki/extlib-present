require File.dirname(__FILE__) + '/spec_helper'
require 'extlib-present/present'

describe "extlib-present" do
  describe "extended object" do
    it "should respond to :present?" do
      nil.should be_respond_to(:present?)
    end

    it "blank object should return false" do
      nil.should_not be_present
      "".should_not be_present
      [].should_not be_present
      {}.should_not be_present
    end

    it "should return true if it is not blank" do
      1.should be_present
      "a".should be_present
      [1].should be_present
      {:a => 1}.should be_present
    end
  end
end
