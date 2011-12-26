class Ranking
  include ActiveModel::Serializers::Xml
  extend ActiveModel::Naming
  
  attr_accessor :trend, :place, :user
  
  def attributes
    ['trend', 'place', 'user', 'matches', 'points', 'coefficient']
  end
  
  def coefficient
    return 0 unless matches && matches > 0
    points.to_f / matches.to_f
  end
end

class Ranking::V1 < Ranking
  attr_accessor :wins, :draws, :losses
  
  def attributes
    ['trend', 'place', 'user', 'wins', 'draws', 'losses', 'matches', 'points', 'coefficient']
  end
  
  def matches
    @wins + @draws + @losses
  end
  
  def points
    @wins * 3 + @draws
  end
end

class Ranking::V2 < Ranking
  attr_accessor :attendances, :first, :second, :third, :fourth
  
  def attributes
    ['trend', 'place', 'user', 'matches', 'points', 'coefficient', 'first', 'second', 'third', 'fourth']
  end
  
  def first
    @attendances.where(:place => 1).count
  end
  
  def second
    @attendances.where(:place => 2).count
  end
  
  def third
    @attendances.where(:place => 3).count
  end
  
  def fourth
    @attendances.where(:place => 4).count
  end

  def matches
    @attendances.count
  end
  
  def points
    first * 3 + second * 2 + third * 1
  end
end  