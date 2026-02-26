module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authorization_therapist, only: [ :create ]


      def create
        therapist = Therapist.find_by(email: params[:email])

        if therapist&.authenticate(params[:password])
          token = JasonWebToken.encode(therapist_id: therapist.id)
          render json: { token: token }, status: :ok
        else
          render json: { error: "Credenciais Inválidas" }, status: :unauthorized
        end
      end

      def logout
        render json: { message: "Logout realizado com sucesso! " }, status: :ok
      end
    end
  end
end
