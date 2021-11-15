class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[ show edit update destroy ]

  def dashboard
    if current_user.member.position.officer
      dashboard_admin()
    else
      events_participated()
      render :dashboard
    end
  end

  def dashboard_admin
    @info = SfkInfo.last

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

    @questions = ApplicationQuestion.all

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

  # GET /dashboard/questions/new
  def q_new
	  @question = ApplicationQuestion.new
    render :q_new
  end

  # POST /dashboard/questions/new
  def q_create
	  @question = ApplicationQuestion.new(question: params[:question])

	  respond_to do |format|
		  if @question.save
			  format.html { redirect_to '/dashboard', notice: "Question was successfully created." }
			  format.json { render :show, status: :created, location: @question }
		  else
			  format.html { render :new, status: :unprocessable_entity }
			  format.json { render json: @question.errors, status: :unprocessable_entity }
		  end
	  end
  end

  # GET /dashboard/questions/:id
  def q_edit
	  @question = ApplicationQuestion.find(params[:id])
    render :q_edit
  end

  # PUT /dashboard/questions/:id
  def q_update
	  respond_to do |format|
		  @question = ApplicationQuestion.find(params[:id])
		  if @question.update(question: params[:question])
			  format.html { redirect_to '/dashboard', notice: "Question was successfully updated." }
			  format.json { render :show, status: :ok, location: @question }
		  else
			  format.html { render :edit, status: :unprocessable_entity }
			  format.json { render json: @question.errors, status: :unprocessable_entity }
		  end
	  end
  end

  # DELETE /dashboard/questions/:id
  def q_destroy
	  @question = ApplicationQuestion.find(params[:id])
	  @question.destroy
      respond_to do |format|
        format.html { redirect_to '/dashboard', notice: "Question was successfully destroyed." }
        format.json { head :no_content }
      end
  end

  # GET /events or /events.json
  def index
    @events = Event.where(date: 1.month.ago..)
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
    delete_participations = Participation.where(event_id: @event.id)
    #delete_participations.each { |x| x.destroy }
    for p in delete_participations
      remove_member = Member.find_by(email: p.member_email)
      remove_event = Event.find_by(id: p.event_id)
      remove_member.update_attribute(:points, remove_member.points - remove_event.points)
      p.destroy
    end

    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
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

    def events_participated
      events_participated = Participation.where(member_email: current_user.member.email)
      @mandatory = 0
      @snack_chalk = 0
      @intramural = 0
      @friend_fundraiser = 0
      @sfk_socials = 0
      @committee_socials = 0
      @sports_fest_prep = 0
      @meetings = 0

      for i in events_participated do
        current_event = Event.find_by(id: i.event_id)
        if (current_event.event_type == 'Mandatory Event')
          @mandatory += current_event.points
        end

        if (current_event.event_type == 'Snack/Chalk')
          @snack_chalk += current_event.points
        end

        if (current_event.event_type == 'Intramural')
          @intramural += current_event.points
        end

        if (current_event.event_type == 'Friend/Fundraiser')
          @friend_fundraiser += current_event.points
        end

        if (current_event.event_type == 'SFK Socials')
          @sfk_socials += current_event.points
        end

        if (current_event.event_type == 'Committee Socials')
          @committee_socials += current_event.points
        end

        if (current_event.event_type == 'Sports Fest Prep')
          @sports_fest_prep += current_event.points
        end

        if (current_event.event_type == 'Meeting')
          @meetings += current_event.points
        end

      end
    end

end
