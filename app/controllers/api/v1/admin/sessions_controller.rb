class Api::V1::Admin::SessionsController < Api::V1::Admin::AppController
  def sign_in
    admin = ::Admin.find_by_username(params[:username]).try(:authenticate, params[:password])
    if admin
      render_success(create_jwt({ uid: admin.uid }))
    else
      render_error('Incorrect login information', 400)
    end
  end

  def sign_out
    render_success(extract_key(params[:token],false))
  end
end
