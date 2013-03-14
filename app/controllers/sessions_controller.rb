class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		redirect_to tasks_url
  	end
  end

  def create
  	if user = User.find_by_email(params[:email])
  		if user.authenticate params[:password]
	  		session[:user_id] = user.id
	  		redirect_to tasks_url, notice: "Welcome back!"
  		else
  			redirect_to login_url, alert: 'Incorrect Credentials'
  		end
  	else
  		user = User.create email: params[:email], password: params[:password]
  		session[:user_id] = user.id
  		redirect_to tasks_url, notice: "Signed Up!"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_url, notice: 'Logged out'
  end
end
