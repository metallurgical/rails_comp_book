class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@title = header_title( :"Add New Product" )
  	@category = Category.all
  	@product = Product.new
  end

  def edit
  end
end
