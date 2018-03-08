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
    @user = User.find_by(username: params["username"])
    if @user
      if params[:password] == @user.password
        session[:user_id] = @user.id #so confusing, is it name user username user_id gonna redo, rspec needs user_id
        redirect '/account'
      end
    end
    erb :error
  end

  get '/account' do

    erb :account
  end

  get '/logout' do
    session.clear
      redirect '/'
  end


end
