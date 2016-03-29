class AnswersController < ApplicationController

  def flag_favorite
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question_id)
    # if the question is owned by the current_user update the value to true unless one already is true

    if @question.has_favorite?
      @question.answers.find_by(favorite: true).update_attributes(favorite: false)
    end

    if @question.user_id == current_user.id
      @answer.update_attributes(favorite: true)
    end

    redirect_to :back
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = current_user.answers.new(answer_params.merge(question_id: params[:question_id]))
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
