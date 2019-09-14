class User < ActiveRecord::Base

  attr_accessor :name
  USERS = []

  def initialize(params)
    @name  = params[:name]
    USERS << self
  end

  def self.all 
  	USERS
  end

end