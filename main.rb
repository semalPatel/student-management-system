require 'sinatra'
require 'sass'
require './student'
require './comment'
require 'sinatra/reloader' if development?

#enable :sessions
configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL']|| "sqlite3://#{Dir.pwd}/development.db") #connecting to db
end

configure :development do
    DataMapper.setup(:default, ENV['DATABASE_URL']|| "sqlite3://#{Dir.pwd}/development.db") #connecting to db
end



get('/styles.css'){ scss :styles }

get '/' do
  	if session[:admin] == true
		erb :home, :layout => :layout2
	else
		erb :home
	end
end

get '/about' do
 	@title = "All About This Website"
  	if session[:admin] == true
		erb :about, :layout => :layout2
	else
		erb :about
	end
end

get '/contact' do
	if session[:admin] == true
		erb :contact, :layout => :layout2
	else
		erb :contact
	end
end

get '/video' do
	if session[:admin] == true
		erb :video, :layout => :layout2
	else
		erb :video
	end
end

not_found do 
	status 404 
	erb :not_found
end

