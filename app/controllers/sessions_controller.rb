class SessionsController < ApplicationController

  def new
    @user = User.new
    @isLogin = true
    render 'users/new'
  end

  def create
    # byebug
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Logged in!"
    else
      flash[:alert] = "Wrong email or password"
      # render :new
      render 'users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path, notice: "Signed out"
  end

end
