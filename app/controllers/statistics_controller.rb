# encoding: utf-8

class StatisticsController < ApplicationController
  before_filter :authenticate_user!, :only => :create
  
  def calculate_rankings(league, limit = Date.today)
    rankings = User.all.map { |u| u.ranking(limit) }.sort { |a,b| b.coefficient <=> a.coefficient }
    i = 1
    rankings.each { |r| r.place = i; i = i + 1 }
  end
  
  def index
    @league = League.first
    last_match_day = Match.maximum(:date) || Date.today
    last_match_day_rankings = calculate_rankings(@league, last_match_day.to_date - 1)
    @rankings = calculate_rankings(@league)
    
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
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rankings }
      format.xml { render xml: @rankings }
    end
  end
  
  def create
    unless params[:winner]
      flash[:error] = 'Es muss ein Wert in der Spalte Gewinner ausgewählt werden.'
      redirect_to root_url
      return
    end
    
    unless params[:participated]
      flash[:error] = 'Es müssen Spieler hinzugefügt werden.'
      redirect_to root_url
      return
    end
    
    if params[:participated].size < 2 || params[:participated].size > 4
      flash[:error] = 'Die Anzahl der Spieler ist kleiner als 2 oder größer als 4.'
      redirect_to root_url
      return
    end
    
    m = Match.new
    m.date = Time.now
    if params[:winner].to_i > 0
      m.winner = User.find(params[:winner])
    end
    m.league = League.first
    m.creator = current_user
    m.save!
    
    params[:participated].each do |p|
      a = Attendance.new
      a.match = m
      a.user = User.find(p)
      a.save!
    end
    
    redirect_to root_url
  end
end
