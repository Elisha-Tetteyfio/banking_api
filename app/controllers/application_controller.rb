class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_user

  private

  def authenticate_user
    begin
      header = request.headers["Authorization"]
      decoded = jwt_decode(header)
      @user = User.find(decoded[:user_id])
    rescue JWT::DecodeError
      render json: {error: "You must be signed in."}, status: :unauthorized
    end
  end
end
