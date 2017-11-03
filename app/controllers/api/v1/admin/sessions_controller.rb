class Api::V1::Admin::SessionsController < Api::V1::Admin::AppController
  def sign_in
    admin = ::Admin.find_by_username(params[:username]).try(:authenticate, params[:password])
    if admin
      render_success({ token: create_jwt({ uid: admin.uid })})
    else
      render_error('Incorrect login information', :bad_request)
    end
  end

  def sign_out
    if current_admin.present?
      current_admin.generate_uid(true, true)
      render_success({ success: true })
    else
      render_error('Something went wrong', :bad_request)
    end
  end
end
