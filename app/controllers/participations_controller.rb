class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participation, only: %i[show edit update destroy]

  # GET /participations or /participations.json
  def index
    unless current_user.member.position.can_change_events
      redirect_to '/', alert: "You don't have permission to view the member participations."
    end

    @participations = Participation.all
  end

  # GET /participations/1 or /participations/1.json
  def show; end

  # GET /participations/new
  def new
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit; end

  # POST /participations or /participations.json
  def create
    @participation = Participation.new(participation_params)
    event = Event.find_by(id: @participation.event_id)

    respond_to do |format|
      if @participation.event_id.present?
        if @participation.user_code == event.confirmation_code
          existence_check = Participation.where(id: event.id, member_email: current_user.member.email)
          if existence_check.empty?
            if @participation.save
              format.html { redirect_to events_path, notice: 'Points have been added to your account.' }
              format.json { render :show, status: :created, location: @participation }
              pmember = Member.find_by(email: @participation.member_email)
              pmember.update_attribute(:points, pmember.points + event.points)
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @participation.errors, status: :unprocessable_entity }
            end
          else
            flash[:alert] = "You've already registered for that event!"
            format.html { render :new, status: :unprocessable_entity }
          end
        else
          flash[:alert] = 'Incorrect confimation code!'
          format.html { render :new, status: :unprocessable_entity }
        end
      else
        flash[:alert] = 'Please select an event!'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1 or /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1 or /participations/1.json
  def destroy
    remove_member = Member.find_by(email: @participation.member_email)
    remove_event = Event.find_by(id: @participation.event_id)
    remove_member.update_attribute(:points, remove_member.points - remove_event.points)

    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_participation
    @participation = Participation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participation_params
    params.require(:participation).permit(:event_id, :member_email, :user_code)
  end
end
