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
  
  get '/tweets/new' do
    if logged_in?
      erb :'/goal_views/new'
    else
      redirect '/login'
    end
  end
    
end