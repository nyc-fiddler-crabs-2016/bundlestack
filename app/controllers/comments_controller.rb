class CommentsController < ActionController::Base

  def new
    binding.pry
    @object_array = params[:query].upcase.split(" ")
    @object_array[1].capitalize!
    @comment = Comment.new
  end

  def create
    binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "comment created successfully"
      redirect_to question_path(@comment, @question)
    else
      render 'comments/new'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
