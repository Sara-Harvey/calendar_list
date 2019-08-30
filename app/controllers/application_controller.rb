class ApplicationController < Sinatra::Base
require 'yaml/store'

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get "/" do
    @title = 'Calendar List'
    erb :index
  end

  post '/add' do 
    "#{params[:event_date]} — #{params[:name]}, submitted by: #{params[:submitted_by]}" 
  end
end
