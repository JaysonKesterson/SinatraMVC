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
      goal = Goal.new(params)
      goal.user = current_user
      goal.save
      redirect "/goals/#{goal.id}"
    else
      redirect '/goals/new'
    end
  end
  
  get '/goals/:id' do
    if logged_in?
      @goal = Goal.find_by_id(params[:id])
      erb :'/goal_views/show'
    else
      redirect '/login'
    end
  end
  
  get '/goals/:id/edit' do
    @goals = Goal.find_by_id(params[:id])
    if logged_in?
      erb :'/goal_views/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    if logged_in?
      if @goal.user == current_user && !params.empty?
        @goal.update(params)
      else
        redirect "/goals/#{@goal.id}/edit"
      end
    else
      redirect '/login'
    end
  end
  
   delete '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
      if logged_in?
        if @goal.user_id == current_user.id
          @goal.delete
        else
          redirect "/goals"
        end
      else
        redirect '/login'
      end
    end
    
end