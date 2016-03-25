class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = Answer.new(answer_params.merge(question_id: @question.id))
    if @answer.save
      flash[:notice] = "Your answer has been posted"
      redirect_to controller: 'questions', action: 'show', id: @question.id
    else
      flash[:notice] = ["There was a problem posting answer"]
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id).merge(user_id: current_user.id)
    end
end
