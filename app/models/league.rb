class League < ActiveRecord::Base
  has_many :matches
  has_many :attendances, :through => :matches
  
  attr_accessible :name, :current, :version
  
  validate :only_one_current
  
  def rankings
    unless @rankings
      last_match_day = self.matches.maximum(:date) || Date.today
      last_match_day_rankings = calculate_rankings(last_match_day.to_date - 1)
      @rankings = calculate_rankings
    
      last_match_day_rankings.each do |r|
        old_place = r.place
        ra = @rankings.find { |ra| ra.user == r.user }
        new_place = ra.place
        if old_place == new_place
          ra.trend = 'equal'
        elsif old_place > new_place
          ra.trend = 'up'
        elsif old_place < new_place
          ra.trend = 'down'
        end
      end
    end
    @rankings
  end
  
  private
  
  def only_one_current
    if current && League.where(:current => true).count > 0 && League.where(:current => true).first.id != self.id
      errors.add :current, "Only one league can be current"
    end
  end
  
  def calculate_rankings(limit = Date.today)
    rankings = User.all.map { |u| u.ranking(self, limit) }.sort { |a,b| b.coefficient <=> a.coefficient }
    i = 1
    rankings.each { |r| r.place = i; i = i + 1 }
  end
  
end
