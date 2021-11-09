class ApplyController < ApplicationController

# GET /questions
def q_index
  @questions = ApplicationQuestion.all
  render :apply
end

# POST /questions
def q_create
end

# PUT /questions/:id
def q_update
end

# DELETE /questions/:id
def q_destroy
end

# GET /answers/:email
def a_index
	@answers = ApplicationAnswer.all
  render :apply
end

# POST /answers
def a_create
  params[:answers].each{ |ans| 
    row = ApplicationAnswer.new(answer: ans[:a], question: ans[:q], 
                                   member_email: params[:email])
    if !row.save
      respond_to do |format|
        format.html { redirect_to '/home', notice: "ERROR: Application not submitted!" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
      return
    end
  }

  respond_to do |format|
    format.html { redirect_to '/home', notice: "Application was successfully submitted." }
    format.json { render :show, status: :created, location: @answer }
  end
end

private
	# Only allow a list of trusted parameters through.
	def answer_params
		params.permit(:email, :answers)
	end
end
