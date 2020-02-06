class UserController < ApplicationController

  get "/homepage" do
    redirect '/goals'
  end

  get '/signup' do
    if logged_in?
      redirect '/users/:id'
    else
      erb :'/user_views/signup'
    end
  end
  
  post '/signup' do
    @user = User.new(params)
        
    if @user.save
      session[:user_id] = @user.id
      redirect '/users/:id'
    else
      redirect '/signup'
    end
  end
  
  get '/login' do
    if logged_in?
      redirect '/users/:id'
    else
      erb :'user_views/login'
    end
  end
  
  post '/login' do
    @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/users/:id'
      else 
        redirect '/login'
      end
    end
    
  get '/logout' do
    session.clear
    redirect '/login'
  end
  
  get '/users/:id' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      @user_goals = Goal.all.select{|goal| goal.user_id == current_user.id}   
      erb :'/user_views/show'
    else
      redirect '/login'
    end
  end 

end