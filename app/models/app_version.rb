# == Schema Information
#
# Table name: app_versions
#
#  id                        :integer          not null, primary key
#  version_file_file_name    :string(255)
#  version_file_content_type :string(255)
#  version_file_file_size    :integer
#  version_file_updated_at   :datetime
#  change_log                :text
#  version_type              :string(255)
#  version_number            :string(255)
#  active                    :boolean
#  created_at                :datetime
#  updated_at                :datetime
#

class AppVersion < ActiveRecord::Base
  has_attached_file :version_file, {
    :url => "/system/app/:hash.:extension",
    :hash_secret => "163dc376143802f6281493d63c88a90c56cafcf2d4176b84b278b0d7536b6b7c2f7cd219ffcf3d7b19438168a67e34dba3c0ac08be2cc6c6f8994801059d7de1"
  } 

  validates_presence_of :version_file, :version_type, :version_number

  before_save :check_active_versions

  scope :active, -> { where('app_versions.active = ?', true) }

  def self.standard
    AppVersion.active.find_by_version_type('standard')
  end

  def self.pro
    AppVersion.active.find_by_version_type('pro')
  end

  private

  def check_active_versions
    if self.active
      AppVersion.active.where('version_type = ?', self.version_type).update_all(active: false)
    end
  end

end
