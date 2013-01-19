require 'spec_helper'

describe Team do
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name).with_message("Name can't be blank") }
  it { should validate_uniqueness_of(:name).with_message("Name must be unique") }
end
