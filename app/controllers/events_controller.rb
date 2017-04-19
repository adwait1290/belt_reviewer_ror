class EventsController < ApplicationController
  def index
  	@events = Event.find(params[:id])
  end
  def show
  	@event = Event.find(params[:id])
  	@count = @event.users.count
  	@comments = @event.comments
  end
  def create
  	event = Event.new event_params
  	unless event.save
  		flash[:errors] = event.errors.full_message
  	end
  	redirect_to "/users/#{current_user.id}"
  end
  def edit
   @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update event_params
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = @event.errors.full_messages     
      redirect_to :back
    end
  end
  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy if @secret.user === current_user
  	redirect_to "/users/#{current_user.id}"
  end
  private
  	def event_params
  	params.require(:event).permit(:doe, :state, :city, :name).merge(user: current_user)
  end 
end
