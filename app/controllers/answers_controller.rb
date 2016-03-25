class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new
  end

  private

    def answer_params
      params.require(:answer).permit(:content).merge(user_id: current_user.id)
    end
end
