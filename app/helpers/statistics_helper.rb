module StatisticsHelper
  def show_trend(ranking)
    if ranking.trend == 'up'
      '<span class="complete status">+</span>'.html_safe
    elsif ranking.trend == 'equal'
      '<span class="status">=</span>'.html_safe
    elsif ranking.trend == 'down'
      '<span class="red status">-</span>'.html_safe
    end
  end
end
