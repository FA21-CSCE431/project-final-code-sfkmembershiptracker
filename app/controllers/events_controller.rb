class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[ show edit update destroy ]

  def dashboard
    if current_user.member.position.officer
      dashboard_admin()
    else
      render :dashboard
    end
  end

  def dashboard_admin
    @applications = {} # key: email, value: array of Q+A for that email
    answers = ApplicationAnswer.all
    answers.each{ |a| 
      if !@applications.key?(a.member_email)
        @applications[a.member_email] = []
      end
      @applications[a.member_email].push({
        :question => a.question,
        :answer => a.answer,
      })
    }

    render :dashboard_admin
  end

  def act_on_applicant
    member = Member.find_by(email: params[:email])
    answers = ApplicationAnswer.where({member_email: params[:email]})
    if answers.size == 0
      raise "Acting on applicant, but applicant has no application answers"
    end

    if params[:commit] == 'Reject'
      if answers.destroy_all && Member.destroy(member[:id])
        redirect_to '/dashboard', notice: "Success! Applicant denied."
      else
        redirect_to '/dashboard', notice: "ERROR: Couldn't delete application or member (idk which)!"
      end
    elsif params[:commit] == 'Accept' 
      member[:position_id] = 2

      # try to save Member and delete ApplicationAnswers
      if !member.save
        redirect_to '/dashboard', notice: "ERROR: Member promotion failed!"
      else
        if !answers.destroy_all
          redirect_to '/dashboard', notice: "ERROR: Couldn't delete application!"
        else
          redirect_to '/dashboard', notice: "Success! Member promoted from applicant."
        end
      end
    else
      raise "unreachable: events#act_on_applicant"
    end
  end

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event } #excluded :confirmation_code
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def signup
    puts "signup function ran"
    participant = Participant.new(params[:event_id, :member_email])
    user_input = gets
    if participant.save
      #right passsword
      puts "right password"
      if user_signed_in?
        if @event.confirmation_code == user_input
          current_user.member.points = current_user.member.points + @event.points
        end
      end
    else
      puts "wrong password"
    end
    #event = Event.find_by(confirmation_code: params[:confirmation_code]])
    #if event.present?
    #    current_user.member.points = current_user.member.points + @event.points
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :event_type, :date, :location, :points, :confirmation_code)
    end
end
