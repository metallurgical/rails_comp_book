class ProductsController < ApplicationController

  before_action :find_category,     only: [:create]
  before_action :find_product,      only: [:edit, :update, :destroy]
  before_action :getAllCategories,  only: [:new, :edit]

  def index
    @title   = header_title( :"All Products" )
    @products = Product.select("products.*, categories.cname").joins(:category)
  end
  
  def new
    @title   = header_title( :"Add New Product" )
    @cat     = Category.new
    @product = @cat.products.build
  end

  def create
    @product = @category.products.create( permit_params )
    if @product.save
      redirect_to :action => 'index', notice: "Successfull created product"
    else
      render 'new'
    end
  end

  def edit
    @title   = header_title( :"Edit Product" )
  end

  def update
    if @product.update( permit_params )
      redirect_to :action => 'index', notice: 'Successfull updated data'
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      redirect_to :action => 'index', notice: 'Successfull deleted data'
    else
      render 'index'
    end
  end

  private

    def permit_params
      params.require(:product).permit(:pname, :pquantity, :pcolor, :pprice, :pno, :category_id)
    end
  
    def find_category
      @category = Category.find( params[:product][:category_id] )
    end

    def find_product
      @product = Product.find( params[:id] )
    end

    def getAllCategories
      # get all categories
      # to display on select html tag
      # in add new product page and
      # in edit new product page ( this share same form with add )
      @catAll  = Category.all
    end
end
