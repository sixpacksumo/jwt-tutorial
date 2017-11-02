class Api::V1::Admin::SessionsController < Api::V1::Admin::AppController
  def sign_in
    render_success(create_jwt({ username: 'sakko' }))
  end

  def sign_out
    render_success(extract_key(params[:token],false))
  end
end
