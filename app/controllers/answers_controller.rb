class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = ["Your answer has been posted"]
      redirect_to question_path
    else
      flash[:notice] = ["There was a problem posting answer"]
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:content).merge(user_id: current_user.id)
    end
end
