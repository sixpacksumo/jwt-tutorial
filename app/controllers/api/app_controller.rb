class Api::AppController < ActionController::API

  def render_success(data)
    res = { status: 200, data: data }
    res[:length] = data.count if data.is_a?(Array)
    render json: res
  end

  def render_error(errors, code)
    render json: { status: code, errors: errors}
  end

end
