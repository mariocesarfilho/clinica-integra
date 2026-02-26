class ApplicationController < ActionController::API
  before_action :authorization_therapist

  private

  def authorization_therapist
    header = request.headers["Authorization"]
    token = header.split("").last if header

    decoded = JasonWebToken.decode(token)

    if decoded
      @current_therapist = Therapist.find(decoded[:therapist_id])
    else
      render json: { error: "Não Autorizado!" }, status: :unauthorized
    end
  end
end
