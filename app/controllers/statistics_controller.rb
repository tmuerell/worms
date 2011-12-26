# encoding: utf-8

class StatisticsController < ApplicationController
  before_filter :authenticate_user!, :only => :create
  
  def index
    @league = current_league
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rankings }
      format.xml { render xml: @rankings }
    end
  end

  def create
    if current_league.version == 1
      create_v1
    else
      create_v2
    end
  end
  
  def create_v2
    unless params[:place]
      flash[:error] = 'Es müssen Gewinner ausgewählt werden.'
      redirect_to root_url
      return
    end
    
    players = params[:place].reject { |k,v| v == '---' }
    
    if players.size < 3 || players.size > 4
      flash[:error] = 'Es müssen drei oder vier Spieler ausgewählt werden.'
      redirect_to root_url
      return
    end
    
    if players.reject { |k,v| v != "1" }.size == 0
      flash[:error] = 'Es muss mindestens ein erster Platz existieren.'
      redirect_to root_url
      return
    end
    
    m = Match.new
    m.date = Time.now
    m.league = current_league
    m.creator = current_user
    m.save!
    
    players.each do |userid,place|
      a = Attendance.new
      a.match = m
      a.user = User.find(userid.to_i)
      a.place = place.to_i
      a.save!
    end
    
    redirect_to root_url
  end
  
  def create_v1
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
    m.league = current_league
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
