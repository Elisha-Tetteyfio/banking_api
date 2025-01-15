class NoAuthController < ApplicationController
  skip_before_action :authenticate_user

  def homepage
    render json: {message: "Welcome to banking app API"}
  end
end