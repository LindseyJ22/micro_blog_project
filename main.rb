require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, "sqlite3:main.sqlite3"
set :sessions, true

def current_user
  if session[:user_id]
    User.find(session[:user_id])
  end
end
	
def user_signed_in?
	!session[:user_id].nil?
end

get '/' do
	
	if !user_signed_in?
			redirect '/log_in'
	end
	@user = current_user
	@users = User.all
	@posts = Post.last(10).reverse
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

post '/new_post' do
	@user = current_user
	@post = current_user.posts.create(params[:post])
	redirect '/profile'
end

get '/profile' do
	@user = current_user
	p @user
	erb :profile
end

post '/log_in' do
	# @user = User.find_by(email: params[:email], password: params[:password])
	@user = User.find_by(params[:user])
	if @user
		session[:user_id] = @user.id #logging them in
		redirect '/'
	else
		redirect '/sign_up'
	end

end
get '/log_out' do
	session[:user_id] = nil #logging them out
	redirect '/'
end

get '/log_in' do
	@user = current_user
	if @user
		redirect '/profile'
	end
	erb :log_in
end

get '/logout' do
	session[:user_id] = nil #logged out
	redirect '/'
end

get '/find_user' do
	erb :find_user
end

post '/find_user' do
	# @name = params[:name]
	if @user = User.where(name: params[:name]) ||
		 @user = User.where(first_name: params[:first_name])
		 	redirect '/'
	else
		redirect '/find_user'
	end
end

get '/users' do
	@users = User.all
	erb :users
end

get '/show/:id' do
	@user = User.find(params[:id])
	erb :show
end

get '/delete_account' do
	@user = current_user
	@user.destroy
	session[:user_id] = nil
	redirect '/'

end
		