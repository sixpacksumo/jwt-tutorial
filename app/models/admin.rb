# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :text
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  uid             :text             not null
#

class Admin < ApplicationRecord
  has_secure_password
end


# admin = Admin.new(username: 'david', password: '', password_confirmation: 'nomatch')
# admin.save                                                       # => false, password required
# admin.password = 'mUc3m00RsqyRe'
# admin.save                                                       # => false, confirmation doesn't match
# admin.password_confirmation = 'mUc3m00RsqyRe'
# admin.save                                                       # => true
# admin.authenticate('notright')                                   # => false
# admin.authenticate('mUc3m00RsqyRe')                              # => admin
# Admin.find_by(username: 'david').try(:authenticate, 'notright')      # => false
# Admin.find_by(username: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => admin
