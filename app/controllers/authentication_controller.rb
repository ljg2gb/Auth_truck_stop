class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: {message: "No user for #{params[:username]}"}
        else
            if !@user.authenticate(params[:password])
                render json: {message: "Wrong password, try again"}
            else
                render json: {message: "correct"}
            end
        end
    end
end
