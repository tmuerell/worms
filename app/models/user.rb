class User < ActiveRecord::Base
  ROLES = ['admin','user']
  devise :database_authenticatable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :worm_team_name, :nickname, :role
  
  has_many :attendances
  has_many :matches, :through => :attendances
  
  def ranking(league, limit = Date.today)
    puts league.inspect
    r = nil
    matches = league.matches.where('date < ?', limit + 1).joins(:attendances).where(:attendances => {:user_id => self})
    if league.version == 1
      r = Ranking::V1.new
      r.wins = matches.where(:winner_id => self).count
      r.draws = matches.where(:winner_id => nil).count
      r.losses = matches.where('winner_id <> ?', self.id).count
    else
      r = Ranking::V2.new
      r.attendances = league.attendances.where(:user_id => self).joins(:match).where('matches_attendances.date < ?', limit + 1)
    end
    r.user = self
    r
  end
  
  def name
    "#{firstname} #{lastname}"
  end
end
