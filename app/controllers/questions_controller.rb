class QuestionsController < ApplicationController

  def index
    @vote = Vote.new
    @questions = Question.all
  end

  def recent
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:success] = "Question created successfully"
      redirect_to questions_path
    else
      flash[:now] = "There was a problem"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user)
  end

  def edit
    @question = Question.find(params[:id])
     authorize_access(@question)
  end

  def update
    @question = Question.find(params[:id])
     authorize_access(@question)
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated successfully"
      redirect_to @question
    else
      flash[:now] = "There was a problem"
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    authorize_access(question)
    question.destroy
    flash[:success] = "Question has been removed."
    redirect_to :root
  end
  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

end
