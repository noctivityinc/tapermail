# == Schema Information
#
# Table name: greylists
#
#  id           :integer          not null, primary key
#  email        :string(255)
#  name         :string(255)
#  submitted_by :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Greylist < ActiveRecord::Base
end
