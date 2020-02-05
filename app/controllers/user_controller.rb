class UserController < ApplicationController

  get "/homepage" do
    erb :"/user_controllers/index.html"
  end

  get '/signup' do
    if logged_in?
      redirect '/homepage'
    else
      erb :'/user_controllers/signup.html'
    end
  end
  
  post '/signup' do
    user = User.new(params)
        
    if user.save
      session[:user_id] = user.id
      redirect '/homepage'
    else
      redirect '/signup'
    end
  end
  
  get '/login' do
    if logged_in?
      redirect '/homepage'
    else
      erb :'user_controllers/login.html'
    end
  end
  
  post '/login' do
    user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/tweets'
      else 
        redirect '/login'
      end
    end

end