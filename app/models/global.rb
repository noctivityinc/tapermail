# == Schema Information
#
# Table name: globals
#
#  id                          :integer          not null, primary key
#  taper_file_file_name        :string(255)
#  taper_file_content_type     :string(255)
#  taper_file_file_size        :integer
#  taper_file_updated_at       :datetime
#  taper_pro_file_file_name    :string(255)
#  taper_pro_file_content_type :string(255)
#  taper_pro_file_file_size    :integer
#  taper_pro_file_updated_at   :datetime
#  created_at                  :datetime
#  updated_at                  :datetime
#

class Global < ActiveRecord::Base
  has_attached_file :taper_file
  has_attached_file :taper_pro_file


end
