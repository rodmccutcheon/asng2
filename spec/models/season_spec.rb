require 'spec_helper'

describe Season do
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:rounds_attributes) }
  it { should validate_presence_of(:name).with_message("Name can't be blank") }
  it { should have_many(:rounds).dependent(:destroy) }
  it { should accept_nested_attributes_for(:rounds).allow_destroy(true) }
end
