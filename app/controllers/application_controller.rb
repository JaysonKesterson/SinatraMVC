require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    @achieved_goals = Goal.all.select {|goal| goal.achieved == "yes"}
    @recently_achieved = @achieved_goals.last
    erb :index
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
     def current_user
      User.find(session[:user_id])
     end
  end

end
