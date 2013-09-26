# == Schema Information
#
# Table name: downloads
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  name             :string(255)
#  token            :string(255)
#  last_download_at :datetime
#  number_remaining :integer          default(5)
#  created_at       :datetime
#  updated_at       :datetime
#

class Download < ActiveRecord::Base

  validates_presence_of :name, :number_remaining
  validates_numericality_of :number_remaining
  validates :token, 
    :presence => true, 
    format: {:with => /\A[a-zA-Z0-9]+\Z/, message: 'must include only letters or numbers, no spaces or characters'}, 
    :uniqueness => true 

  before_validation :generate_token

  private

  def generate_token
    if self.token.blank?
      begin
        token = Devise.friendly_token
      end while Download.where(:token => token).exists?
      self.token = token
    end
  end
end
