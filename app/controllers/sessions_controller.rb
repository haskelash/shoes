class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "Success: Welcome back, #{@user.first_name}."
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      @user = User.new
      render '/users/new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
