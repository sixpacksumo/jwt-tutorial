class AddUidToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :uid, :text
    add_index :admins, :uid
    Admin.all.each do |admin|
      admin.update_columns(uid: SecureRandom.urlsafe_base64(20))
    end
    change_column :admins, :uid, :text, null: false
  end
end
