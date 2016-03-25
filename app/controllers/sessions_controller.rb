class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] =  "#{@user.username} is successfully logged in."
      redirect_to questions_path #look at me!
    else
      flash[:error] = "username or password is incorrect."
      render 'new'
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end


end