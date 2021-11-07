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
	@answer = ApplicationAnswer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to answers_url, notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
end

private
	# Only allow a list of trusted parameters through.
	def answer_params
		params.permit(:answer, :question, :member_email)
	end
end
