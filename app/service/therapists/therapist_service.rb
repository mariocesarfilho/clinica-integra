require "ostruct"
module Therapists
  class AuthService
    def self.create(therapist_params)
      therapist = Therapist.new(therapist_params)
      if therapist.save
        token = JasonWebToken.encode(therapist_id: therapist.id)

        OpenStruct.new(
        success?: true,
        therapist: therapist,
        token: token
        )
      else
        OpenStruct.new(
          success?: false,
          errors: therapist.errors.full_messages
        )
      end
    end
  end
end
