module Api
  module V1
    class PatientsController < ApplicationController
      skip_before_action :authorization_user, only: [ :create ]
      before_action :set_patient, only: [ :update, :destroy, :show ]

      def index
        patients = Patient.all
        render json: patients
      end

      def show
        render json: @patient
      end

      def create
        patient = Patients::PatientService.register(patient_params)

        if patient.success?
          render json: { token: patient.token, patient: patient.patient }, status: :created
        else
          render json: { errors: patient.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @patient.update(patient_params)
          render json: @patient, status: :ok
        else
          render json: @patient.error, status: :unprocessable_entity
        end
      end

      def destroy
        @patient.destroy
        head :no_content
      end

    private

    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :date, :diagnosis, :mediaction)
    end
    end
  end
end
