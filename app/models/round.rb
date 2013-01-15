class Round < ActiveRecord::Base
  attr_accessible :season_id, :name
  validates_presence_of :season_id

  validates :name, :presence => { :message => "Round Name can't be blank" }, :uniqueness => { :scope => :season_id }

  belongs_to :season
end
