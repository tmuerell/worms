class Match < ActiveRecord::Base
  belongs_to :league
  belongs_to :creator, :class_name => 'User'
  belongs_to :winner, :class_name => 'User'
  has_many :attendances, :dependent => :destroy
  
  attr_accessible :league_id, :creator_id, :date
  
  validates_presence_of :league, :creator, :date
end
