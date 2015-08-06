class SessionsController < ApplicationController
 def new
   # Renders the sessions/new.html.erb template
   render :new
 end

 def create
   email = params[:session][:email]
   password = params[:session][:password]
   @user = User.find_by(email: email)
   if @user.nil?
     flash[:error] = "Failed To Authenticate. Please try again."
     redirect_to '/login'
   else    
     @user.authenticate(password)
     session[:user_id] = @user.id # create a session for the user
     redirect_to '/profile'
   end
 end

 def destroy
   session[:user_id] = nil
   redirect_to root_path
 end
 
end