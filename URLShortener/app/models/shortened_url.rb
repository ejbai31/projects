# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'
class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :long_url, :short_url, presence: true, uniqueness: true

  def self.random_code
    rcode = SecureRandom.urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url: rcode)
      rcode = SecureRandom.urlsafe_base64(16)
    end
    rcode

  end

  def create_obj(user_id, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: self.random_code)
  end
end
