class Api::V1::Admin::AppController < Api::V1::AppController
  before_action :current_admin
  def current_admin
    return @current_admin if @current_admin.present?
    bearer = request.headers["Authorization"]
    token = bearer.split(" ").last rescue nil
    uid = extract_payload(token)[:uid] rescue nil
    @current_admin = ::Admin.find_by_uid(uid) if uid.present?
    @current_admin
  end
end
