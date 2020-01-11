class UsersController < ApplicationController
    def index
        @users = User.all

        render json: @users, include: :books
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def create
        @user = User.create(user_params)

        render json: @user, status: :created
    end

    def update 
        @user = user.find(params[:id])
        @user = user.update(user_params)
    end

    def destroy
        @user = user.find(params[:id])
        @user.destroy

        render status: 204
    end
end

private 

def user_params
    params.require(:user).permit(:username, :email, :password)
end
