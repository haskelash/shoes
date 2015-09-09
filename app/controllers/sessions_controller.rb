class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Success: account created."
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy

  end
end
