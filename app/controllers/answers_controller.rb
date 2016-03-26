class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      flash[:success] = "Your answer has been posted"
      redirect_to question_path(@question)
    else
      flash[:now] = "There was a problem"
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    authorize_access(@answer)
    @question = @answer.question #why do we need this line???
  end


  def update
    @answer = Answer.find(params[:id])
    authorize_access(@answer)
    if @answer.update(answer_params)
      flash[:success] = "Your answer has been updated"
      redirect_to question_path(@answer.question)
    else
      flash[:now] = "There was a problem"
      render :edit
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    authorize_access(answer)
    question = answer.question
    answer.destroy
    flash[:success] = "Your answer has been removed."

    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
