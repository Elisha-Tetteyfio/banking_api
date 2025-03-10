# frozen_string_literal: true
require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern

  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload)
    payload[:exp] = 1.days.from_now.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    data = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(data)
  end
end