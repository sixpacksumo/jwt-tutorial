class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_save :generate_uid, on: [:create]

  def generate_uid(force=false, save=false)
    self.uid = SecureRandom.urlsafe_base64(20) if self.uid.blank? || force
    self.update_columns(uid: self.uid) if save
  end

end
