class GoalController < ApplicationController
  
  get '/goals' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      @goals = Goal.all
      erb :'/goal_views/goals'
    else
      redirect '/login'
    end
  end 
  
  get '/goals/new' do
    if logged_in?
      erb :'/goal_views/new'
    else
      redirect '/login'
    end
  end
  
  post '/goals' do
    if !params.empty?
      goal = Goal.new(:content => params[:content], :user_id => session[:user_id])
      goal.save
      redirect "/goals/#{goal.id}"
    else
      redirect '/goals/new'
    end
  end
    
end