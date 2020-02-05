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

end