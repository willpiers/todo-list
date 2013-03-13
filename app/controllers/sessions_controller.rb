class SessionsController < ApplicationController
  def new
  end

  def create
  	if user = User.find_by_email(params[:email])
  		if user.password == params[:password]
	  		session[:user_id] = user.id
	  		redirect_to tasks_url, notice: "Signed in!"
  		else
  			redirect_to login_url, alert: 'Incorrect Credentials'
  		end
  	else
  		user = User.new
  		user.email = params[:email]
  		user.password = params[:password]
  		user.save
  		redirect_to tasks_url, notice: "Signed Up!"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_url, notice: 'Logged out'
  end
end
