class ProductsController < ApplicationController
  def index
  end

  def create
    @product = Product.new
    @product.name  = params[:product][:name]
    @product.price = params[:product][:price]
    @product.seller_id = current_user.id

    if @product.save
      flash[:success] = "Success: product added."
    else
      flash[:danger] = "Failure: product not added."
    end

    redirect_to "/users/#{current_user.id}"

  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:success] = "Success: product deleted."
    else
      flash[:danger] = "Failure: product not deleted."
    end

    redirect_to "/users/#{current_user.id}"
  end
end
