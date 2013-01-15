class Season < ActiveRecord::Base
  attr_accessible :name, :rounds_attributes
  validates :name, :presence => { :message => "Name can't be blank" }
  validates_associated :rounds

  has_many :rounds, :dependent => :destroy
  accepts_nested_attributes_for :rounds, :allow_destroy => true
end
