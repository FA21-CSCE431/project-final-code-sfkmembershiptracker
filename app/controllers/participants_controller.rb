class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @participant = Participant.new(participation_params)
    if check_code
      @participant.save
      redirect_to @participant.event
    else
      redirect_to @participant.event, notice: "Incorrect Code"
    end
  end

  private
    def participation_params
      params.require(:event).permit(:event_id, :member_email, :user_code)
    end

    def check_code
      @event = Event.find(params[:event_id])
      return @event.confirmation_code == @participant.user_code
    end

end
