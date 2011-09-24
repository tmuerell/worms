class User < ActiveRecord::Base
  ROLES = ['admin','user']
  devise :database_authenticatable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :worm_team_name, :nickname, :role
  
  has_many :attendances
  has_many :matches, :through => :attendances
  
  def ranking(limit = Date.today)
    r = Ranking.new
    r.user = self
    r.wins = matches.where('date < ?', limit + 1).where(:winner_id => self).count
    r.draws = matches.where('date < ?', limit + 1).where(:winner_id => nil).count
    r.losses = matches.where('date < ?', limit + 1).where('winner_id <> ?', self.id).count
    r
  end
  
  def name
    "#{firstname} #{lastname}"
  end
end
