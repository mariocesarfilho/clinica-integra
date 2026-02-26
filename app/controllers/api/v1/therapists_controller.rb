module Api
  module V1
    class TherapistsController < ApplicationController
      skip_before_action :authorization_therapist, only: [ :create ]
      before_action :set_therapist, only: [ :show, :update, :destroy ]

      def index
        therapist = Therapist.all
        render json: therapist
      end

      def show
        render json: @therapist
      end

      def create
        therapist = Therapists::AuthService.create(therapist_params)
        if therapist.success?
          render json: { therapist: therapist.therapist, token: therapist.token }, status: :created
        else
          render json: { errors: therapist.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @therapist.update(therapist_params)
          render json: @therapist, status: :ok
        else
          render json: @therapist.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @therapist.destroy
        head :no_content
      end


      private

      def set_therapist
        @therapist = Therapist.find(params[:id])
      end

      def therapist_params
        params.require(:therapist).permit(:name, :cpf, :email, :password, :password_confirmation)
      end
    end
  end
end
