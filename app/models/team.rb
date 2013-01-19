class Team < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :message => "Name can't be blank"
  validates_uniqueness_of :name, :message => "Name must be unique"
end
