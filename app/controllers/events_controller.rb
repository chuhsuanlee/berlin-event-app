class EventsController < ApplicationController
  def index
    @events = Event.search(params[:web_source], params[:date], params[:title])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
    redirect_to @event
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:web_source, :item_id, :date, :title)
    end
end
