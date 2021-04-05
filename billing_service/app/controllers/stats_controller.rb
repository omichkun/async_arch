class StatsController < ApplicationController

  def index

  end

  def my
    render json: {hello: 'world'}
  end
end