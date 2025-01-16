class AuthController < ApplicationController
  
  skip_before_action :authenticate_user
  
  # POST request 'auth/login'
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token =  jwt_encode(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), token: token}, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end
end
