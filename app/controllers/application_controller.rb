require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["name"], password: params["password"])
    session[:user_id] = @user.id #so confusing, is it user username user_id gonna redo
    redirect '/account'
  end

  get '/account' do

    erb :account
  end

  get '/logout' do
    session.clear
      redirect '/'
  end


end
