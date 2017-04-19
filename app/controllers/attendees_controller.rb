class AttendeesController < ApplicationController
  def create
  	Attendee.create attendee_params
  	redirect_to :back
  end

  def destroy
  	@attendee = Attendee.find_by(event_id: params[:attendee][:event_id])
  	@attendee.destroy if current_user.id == @attendee.user_id
  	redirect_to :back
  end
  private
  def attendee_params
  	params.require(:attendee).permit(:event_id).merge(user: current_user)
  end
end
