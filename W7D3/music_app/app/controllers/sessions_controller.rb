class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if @user
            session[:session_token] = @user.reset_session_token!
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        end
    end

    def destroy
        logout!
        flash[:messages] = ["Successful logged out! :)"]
        redirect_to new_session_url
    end
end
