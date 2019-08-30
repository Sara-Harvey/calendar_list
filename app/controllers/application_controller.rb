class ApplicationController < Sinatra::Base
require 'yaml/store'

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get "/" do
    erb :index
  end

  post '/add' do
    @title = 'Got it!'
    @event = params['event'] 
    @date = params['event_date']
    @submitted_by = params['submitted_by']

    @store = YAML::Store.new 'events.yml'
    @store.transaction do 
      @store['events'] = {}
      @store['events'][@event]
      @store['events'][@date]
      @store['events'][@submitted_by]
    end
    erb :add
  end

  get '/results' do
    @title = 'Results so far:'
    @store = YAML::Store.new 'events.yml'
    @events = @store.transaction { @store['events'] }
    
    erb :results
  end
end