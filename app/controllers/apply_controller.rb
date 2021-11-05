class ApplyController < ApplicationController
# GET /questions
def q_index
  @questions = ApplicationQuestion.all
  render :apply
end
end
