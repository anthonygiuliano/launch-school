require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @users = YAML::load_file('data/users.yml')
  @title = 'Users'
end

helpers do
  def count_interests
    total_interests = 0
    @users.each do |_, attributes|
      total_interests += attributes[:interests].count
    end
    total_interests
  end
end

get '/' do
  erb :home
end

get '/users/:name' do
  @name = params[:name]
  @user = @users[@name.to_sym]
  @title = @name
  erb :user
end

not_found do
  redirect '/'
end
