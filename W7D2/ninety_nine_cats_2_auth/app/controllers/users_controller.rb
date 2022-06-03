class UsersController < ApplicationController

    # before_action :login_user!, only: [:new, :create]

    def new 
        @user = User.new
        render :new
    end

    def create
        # user = User.create(user_params)
        user = User.new(user_params)

        if user.save!
            login_user!(user)
            redirect_to users_url(user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
