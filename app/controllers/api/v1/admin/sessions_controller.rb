class Api::V1::Admin::SessionsController < Api::V1::Admin::AppController
  def sign_in
    render_success({ username: 'sakko' })
  end

  def sign_out
    render_success([1,2,3,4])
  end
end
