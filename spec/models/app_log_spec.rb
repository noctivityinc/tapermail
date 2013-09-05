# == Schema Information
#
# Table name: app_logs
#
#  id           :integer          not null, primary key
#  uuid         :string(255)      not null
#  email_domain :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe AppLog do
  pending "add some examples to (or delete) #{__FILE__}"
end
