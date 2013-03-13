class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		redirect_to tasks_url
  	end
  end

  def create
  	if user = User.find_by_email(params[:email])
  		if user.password == params[:password]
	  		session[:user_id] = user.id
	  		redirect_to tasks_url, notice: "Welcome back!"
  		else
  			redirect_to login_url, alert: 'Incorrect Credentials'
  		end
  	else
  		user = User.new
  		user.email = params[:email]
  		user.password = params[:password]
  		user.save
  		session[:user_id] = user.id
  		redirect_to tasks_url, notice: "Signed Up!"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_url, notice: 'Logged out'
  end
end
