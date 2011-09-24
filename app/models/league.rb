class League < ActiveRecord::Base
  has_many :matches
  
  attr_accessible :name
end
