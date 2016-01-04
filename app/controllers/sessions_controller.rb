class SessionsController < ApplicationController
    def new
    end
    def create
       user = User.find_by_username(params[:session][:username])
       if user && user.authenticate(params[:session][:password])
           log_in user
           redirect_to user
       else
           if user
               message = "Wrong password!"
           else
               message = "This user doesn't exist!"
           end
           render 'new' 
       end
    end
    def destroy
       logout
       redirect_to root_path
    end
end
