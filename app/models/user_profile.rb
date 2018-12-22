# frozen_string_literal: true

# Model class for shoulda test
class UserProfile
  include ActiveModel::Model
  attr_accessor :website_url

  validates :website_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp

  has_secure_password
end
