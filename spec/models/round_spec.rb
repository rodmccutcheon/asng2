require_relative '../spec_helper'

describe Round do
  it { should allow_mass_assignment_of(:season_id) }
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name).with_message("Round name can't be blank") }
  it { should validate_uniqueness_of(:name).scoped_to(:season_id).with_message("Round name must be unique for season") }
  it { should belong_to(:season) }
end
