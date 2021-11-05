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
def a_show
end

# POST /answers
def a_create
end

end
