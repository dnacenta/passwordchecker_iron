require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative "lib/passwordchecker.rb"

set :haml, format: :html5
enable(:sessions)

get '/' do
  erb(:index)
end

post "/login" do

  @username = params[:username]
  @password = params[:password]
  passwordchecker = PasswordChecker.new
  return redirect to("/my_site") if passwordchecker.check_password(@username,@password)
  redirect to("/")
end

get "/my_site" do 
  erb(:my_site)
end
