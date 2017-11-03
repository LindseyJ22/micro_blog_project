require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, "sqlite3:main.sqlite3"
get '/' do
	erb :home
end
		