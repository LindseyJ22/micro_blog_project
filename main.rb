require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, "sqlite3:main.sqlite3"
set :sessions, true

get '/' do
	@users = User.all
	@posts = Post.all
	erb :home
end

get '/sign_up' do
	erb :sign_up
end

post '/sign_up' do
	@name = params[:name]
	@user = User.create(params[:user])
	p params
	session[:user_id] = @user.id
	redirect '/'
end
		