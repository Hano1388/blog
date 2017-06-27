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

      # if params[:remember_me]
      #   cookies.permanent[:auth_token] = user.auth_token
      # else
      #   cookies[:auth_token] = user.auth_token
      # end

      redirect_to posts_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Wrong email or password"
      # render :new
      render 'users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    # cookies.delete(:auth_token)
    redirect_to posts_path, notice: "Signed out"
  end

end
