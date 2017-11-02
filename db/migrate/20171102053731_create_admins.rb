class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.text :username
      t.text :password_digest

      t.timestamps
    end
    add_index :admins, :username
  end
end
