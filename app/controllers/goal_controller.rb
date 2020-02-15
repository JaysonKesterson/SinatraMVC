class GoalController < ApplicationController
  
  get '/goals' do
    if logged_in?
      @user = current_user
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
    if goal.save
      redirect "/goals/#{goal.id}"
    else 
      redirect '/goals/new'
    end
    else
      redirect '/goals/new'
    end
  end
  
  get '/goals/:id' do
    if logged_in?
      @goal = Goal.find_by_id(params[:id])
      if @goal
        erb :'/goal_views/show'
      else 
        erb:'/goal_views/error'
      end
    else
      redirect '/login'
    end
  end
  
  get '/goals/:id/edit' do
    @goal = Goal.find_by_id(params[:id])
    if logged_in? 
      if current_user == @goal.user
      erb :'/goal_views/edit'
      else
      redirect "/goals/#{@goal.id}"
      end
    else
      redirect '/login'
    end
  end
  
  patch '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    if logged_in?
      if @goal.user == current_user && !params.empty?
        @goal.goal_name = params[:goal_name]
        @goal.description = params[:description]
        @goal.achieved = params[:achieved]
        @goal.save
        redirect to "/goals/#{@goal.id}"
      else
        redirect "/goals/#{@goal.id}"
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
          redirect '/'
        else
          redirect "/goals"
        end
      else
        redirect '/login'
      end
    end
    
end