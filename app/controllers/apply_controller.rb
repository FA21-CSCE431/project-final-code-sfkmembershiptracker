class ApplyController < ApplicationController

# GET /questions
def q_index
  @questions = ApplicationQuestion.all
  render :apply
end

# POST /questions
def q_create
	@question = ApplicationQuestion.new(question_params)

	respond_to do |format|
		if @question.save
			format.html { redirect_to '/apply', notice: "Question was successfully created." }
			format.json { render :show, status: :created, location: @question }
		else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @question.errors, status: :unprocessable_entity }
		end
	end
end

# GET /questions/1/edit
def q_edit
	@question = ApplicationQuestion.find(params[:id])
end
	
# PUT /questions/:id
def q_update
	respond_to do |format|
		@question = ApplicationQuestion.find(params[:id])
		if @question.update(question_params)
			format.html { redirect_to '/apply', notice: "Question was successfully updated." }
			format.json { render :show, status: :ok, location: @question }
		else
			format.html { render :edit, status: :unprocessable_entity }
			format.json { render json: @question.errors, status: :unprocessable_entity }
		end
	end
end

# DELETE /questions/:id
def q_destroy
	@question = ApplicationQuestion.find(params[:id])
	@question.destroy
    respond_to do |format|
      format.html { redirect_to '/apply', notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
end

def q_delete
	@question = ApplicationQuestion.find(params[:id])
end

# GET /questions/new
def q_new
	@question = ApplicationQuestion.new
end

# GET /answers/:email
def a_index
	@answers = ApplicationAnswer.all
  render :apply
end

# POST /answers
def a_create
	new_member = Member.new({
		email: current_user.id,
		full_name: current_user.full_name,
		phone: params[:phone_number],
		grad_date: params[:graduation],
		position_id: 1, # applicant
	})

	if !new_member.save
		raise "New member not saved!"
	end

  params[:answers].each{ |ans| 
    row = ApplicationAnswer.new(answer: ans[:a], question: ans[:q], 
                                   member_email: current_user.id)
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
	def question_params
		params.permit(:question)
	end
	
	# Only allow a list of trusted parameters through.
	def answer_params
		params.permit(:email, :answers)
	end
	
end
