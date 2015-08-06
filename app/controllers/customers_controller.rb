class CustomersController < ApplicationController

  def index
  end

  def new
  	@title = header_title( :"Register Account" )
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.create ( permit_params )
  	@msg = 1
  	if @customer.save && @customer.authenticate(params[:password])  		
  		respond_to do |format|
  			format.html { redirect_to :action => "new", notice: "SuccessFull Create Account"}
  			format.js
  		end
=begin
  	else
  		render 'new'
=end

  	end
  end

  def show
  end

  def edit
  end

  def permit_params
  	allParams = :ic, :phone, :email, :address, :gender, :username, :password
  	params.require( :customer ).permit( allParams )
  end

end
