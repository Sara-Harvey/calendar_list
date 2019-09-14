class Event < ActiveRecord::Base

  attr_accessor :name, :event_date, :event_time, :notes, :submitted_by
  EVENTS = []

  def initialize(params)
    @name  = params[:name]
    @event_date = params[:event_date]
    @event_time  = params[:event_time]
    @notes = params[:notes]
    @submitted_by = params[:submitted_by]
    EVENTS << self
  end

  def self.all 
    EVENTS
  end

end