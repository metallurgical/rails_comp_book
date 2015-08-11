class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	def header_title ( title ) 
		@title = title
  	end

  	def isAdmin
  		@flag = true if session[:category] == "admin"
  	end

  	helper_method :isAdmin

end
