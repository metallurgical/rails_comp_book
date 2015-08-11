class CategoriesController < ApplicationController

	before_filter :find_data, only: [ :edit, :destroy, :show, :update ]

  def index
  	@title = header_title( :"All categories" )
  	@categories = Category.all
  end

  def new
  	@title = header_title( :"Add New Category" )
  	@category = Category.new
  end

  def create
  	@category = Category.create ( permit_params )
  	if @category.save
  		redirect_to :action => 'index', notice: "Successfull Added Category"
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @category.update( permit_params )
  		redirect_to :action => 'index', notice: "Successfull Update Category"
  	else
  		render 'edit'
  	end  			
  end

  def destroy
  	if @category.destroy
  		redirect_to :action => "index", notice: "Successfull Delete Category"
  	else
  		render 'index'
  	end
  end

  def find_data
  	@category = Category.find( params[:id] )
  end

  private
  	def permit_params
  		params.require( :category ).permit( :cname )
  	end

end
