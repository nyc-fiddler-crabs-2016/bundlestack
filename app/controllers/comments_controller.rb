class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = resource.comments.build(comment_params.merge(user: current_user))

    if comment.save
      flash[:success] = "Comment is created."
      redirect_to redirect_url_after_create resource
    else
      flash[:error] = "Comment can't be created."
      redirect_to redirect_url_after_create resource
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize_access(@comment)
    resource
  end

  def update
    @comment = Comment.find(params[:id])
    authorize_access(@comment)
    if @comment.update(comment_params)
       flash[:success] = "Comment Updated."
       redirect_to comment_source_path(@comment)
     else
       flash[:error] = "Something went wrong. please try again."
       render 'edit'
     end
   end

  def destroy
    comment = Comment.find(params[:id])
    authorize_access(comment)
    comment.destroy
    flash[:success] = "Comment Removed."
    redirect_to :back
  end

  private

  def resource
    @resource ||= if params[:question_id]
      Question.find(params[:question_id])
    else
     Answer.find(params[:answer_id])
    end
  end

  helper_method :resource

    def comment_params
      params.require(:comment).permit(:content)
    end

    def redirect_url_after_create(resource)
    resource.is_a?(Answer) ? question_path(resource.question) : resource
  end

end
