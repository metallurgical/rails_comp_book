class PrivatesController < ApplicationController
  def index
  	@title = header_title( :"Admin Dashboard" )
  end

  def edit
  end

  def show
  end

  def new
  end

  def login
  	@title = header_title( :"Administrator Login" )
  end

  def doLogin
  	@admin = Private.where( 'username = ? and password = ?', params[:username], params[:password]).first
  	if @admin.present?
  		session[:category] = "admin"
  		session[:user_id] = @admin.id
  		redirect_to :action => 'index'
  	else
  		render 'login'
  	end

  end
end
