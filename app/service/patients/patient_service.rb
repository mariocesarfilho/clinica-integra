require "ostruct"

module Patients
  class PatientService
    def self.register(patient_params)
      patient = Patient.new(patient_params)

      if patient.success?
        token = JasonWebToken.encode(patient_id: patient.id)
        OpenStruct.new(
          patient: patient,
          token: token,
          success: true
        )
      else
        OpenStruct.new(
          success: false,
          error: patient.errors.full_messages
        )
      end
    end
  end
end
