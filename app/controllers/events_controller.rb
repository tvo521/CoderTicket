class EventsController < ApplicationController
  def index
    @events = params[:search] ? Event.where('name LIKE ?', "%#{params[:search]}%") : Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
