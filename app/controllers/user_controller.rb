class UserController < ApplicationController

  get "/homepage" do
    redirect '/goals'
  end

  get '/signup' do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :'/user_views/signup'
    end
  end
  
  post '/signup' do
    @user = User.new(params)
        
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{current_user.id}"
    else
      redirect '/signup'
    end
  end
  
  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :'user_views/login'
    end
  end
  
  post '/login' do
    @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
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
      @user = current_user
      @user_goals = Goal.all.select{|goal| goal.user_id == current_user.id}   
      erb :'/user_views/show'
    else
      redirect '/login'
    end
  end 

end