class Round < ActiveRecord::Base
  attr_accessible :season_id, :name
  validates_presence_of :season_id

  validates_presence_of :name, :message => "Round name can't be blank"
  validates_uniqueness_of :name, :scope => :season_id, :message => "Round name must be unique for season"

  belongs_to :season
end
