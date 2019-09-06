class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get "/" do
    @title = 'Calendar List'
    erb :new
  end

  post '/add' do 
    @title = 'Got it!'
    
    @user = User.new(params[:user])
    params[:user][:events].each do |event_details|
      Event.new(event_details)
    end

    @events = Event.all

    erb :add
  end
end