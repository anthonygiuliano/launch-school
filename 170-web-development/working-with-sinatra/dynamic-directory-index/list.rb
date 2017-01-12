require 'sinatra'
require 'sinatra/reloader'
require "tilt/erubis"

root = Dir.pwd + '/public'

get "/" do
  @files = Dir.glob("public/*").map {|file| File.basename(file)}.sort
  @files.reverse! if params[:sort] == "desc"
  erb :list
end
