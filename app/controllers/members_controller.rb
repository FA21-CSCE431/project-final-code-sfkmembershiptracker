class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i[ profile show edit update destroy ]

  # GET /members or /members.json
  def index
    if !current_user.member.position.can_change_roster
      redirect_to "/", alert: "You don't have permission to view the member roster."
    end
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
    if !current_user.member.position.member
      redirect_to "/status"
    end
  end

  def profile
    render "show"
  end

  # GET /status
  def status
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      if action_name != "profile"
        @member = Member.find(params[:email])
      else
        @member = current_user.member
      end
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:email, :full_name, :phone, :bio, :position_id, :grad_date, :points, :application_id)
    end
end
