class ApplicationController < Sinatra::Base
require 'yaml'

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get "/" do
    @title = 'Calendar List'
    erb :index
  end

  post '/add' do 
    File.open("events.yml", "w") { |file| file.write(params.to_yaml) }
    erb :add
  end

  get '/results' do
     @full_list = YAML.load(File.read("events.yml"))
     erb :results
  end
end
