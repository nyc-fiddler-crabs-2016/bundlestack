class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.answers.build
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "question created successfully"
      redirect_to questions_path
    else
      render 'questions/new'
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :content).merge(user_id: current_user.id)
    end

end
