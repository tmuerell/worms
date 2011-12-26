class User < ActiveRecord::Base
  ROLES = ['admin','user']
  devise :database_authenticatable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :worm_team_name, :nickname, :role
  
  has_many :attendances
  has_many :matches, :through => :attendances
  
  def ranking(league, limit = Date.today)
    puts league.inspect
    r = nil
    if league.version == 1
      r = Ranking::V1.new
      r.wins = league.matches.where('date < ?', limit + 1).where(:winner_id => self).count
      r.draws = league.matches.where('date < ?', limit + 1).where(:winner_id => nil).count
      r.losses = league.matches.where('date < ?', limit + 1).where('winner_id <> ?', self.id).count
    else
      r = Ranking::V2.new
      r.attendances = league.attendances.where(:user_id => self)
    end
    r.user = self
    r
  end
  
  def name
    "#{firstname} #{lastname}"
  end
end
