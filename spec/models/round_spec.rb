require_relative '../spec_helper'

describe Round do
  it "validates the presence of season_id, name" do
    round = Round.new
    %w[season_id name].each do |attr|
      round.should have(1).error_on(attr)
    end
  end

  it "validates the name is unique for a given season" do
    round_name = "Round 1"
    round = FactoryGirl.create(:round, :name => round_name)

    round2 = Round.new(:name => round_name, :season_id => round.season_id)
    round2.should have(1).error_on("name")

    # To rule out a false positive, make sure a duplicate round name can exist for different seasons
    round3 = Round.new(:name => round_name, :season_id => round.season_id + 1)
    round3.should_not have(1).error_on("name")
  end

end
