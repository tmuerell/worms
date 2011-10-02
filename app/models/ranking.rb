class Ranking
  include ActiveModel::Serializers::Xml
  extend ActiveModel::Naming
  
  attr_accessor :trend, :place, :user, :wins, :draws, :losses
  
  def attributes
    ['trend', 'place', 'user', 'wins', 'draws', 'losses', 'matches', 'points', 'coefficient']
  end
  
  def matches
    @wins + @draws + @losses
  end
  
  def points
    @wins * 3 + @draws
  end
  
  def coefficient
    return 0 unless matches && matches > 0
    points.to_f / matches.to_f
  end
end