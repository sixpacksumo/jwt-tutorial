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

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
