require 'spec_helper'

describe Season do
  it "validates the presence of name" do
    season = Season.new
    season.should have(1).error_on("name")
  end
end
