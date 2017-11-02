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
    uid = extract_payload(params[:token])[:uid] rescue nil
    admin = ::Admin.find_by_uid(uid) if uid.present?
    admin.generate_uid(true, true) if admin.present?
    render_success({ success: true })
  end
end
