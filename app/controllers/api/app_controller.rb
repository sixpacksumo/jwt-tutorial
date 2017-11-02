class Api::AppController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  include Api::JwtHelper

  def render_success(data)
    render json: data, status: :ok
  end

  def render_error(errors, code)
    render json: {errors: errors}, status: code
  end
end
