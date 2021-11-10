class ParticipantsController < ApplicationController

  def participation_index
    @participation = Event.all
  end

  def participation_create
    @participantion = Participant.new(participation_params)
  end

  def participation_update
  end

  def participation_destroy
  end



  private
    def participation_params
      params.permit(:event_id, :member_email)
    end

end
