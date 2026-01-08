module Api
  module V1
    class AuthsController < ApplicationController
      def register
        user = AuthService.register(auth_params).save

        if user.save
          render json: { message: user[:message] }, status: :created
        else
          render json: { message: user[:message] }, status: :unprocessable_entity
        end
      end

      private

      def auth_params
        params(:user).permit(:username, :email, :password, :cpf, :password, :password_confirmation)
      end
    end
  end
end
