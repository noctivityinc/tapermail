# == Schema Information
#
# Table name: app_logs
#
#  id           :integer          not null, primary key
#  uuid         :string(255)      not null
#  email_domain :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  bytes_sent   :integer
#  bytes_recv   :integer
#

class AppLog < ActiveRecord::Base

  validates_presence_of :uuid, :email_domain
end
