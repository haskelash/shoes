class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @product = Product.new
  end

  def new
    if logged_in?
      redirect_to "/users/#{current_user.id}"
    end

    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name            = params[:user][:first_name]
    @user.last_name             = params[:user][:last_name]
    @user.email                 = params[:user][:email]
    @user.password              = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      log_in @user
      flash[:success] = "Success: account created."
      redirect_to @user
    else
      render 'new'
    end
  end

  def buy
    @product = Product.find(params[:id])
    @product.buyer_id = current_user.id

    if @product.save
      flash[:success] = "Success: purchase complete."
    else
      flash[:failure] = "Failure: purchase not complete."
    end

    redirect_to "/users/#{current_user.id}"
  end
end
