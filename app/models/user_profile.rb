# frozen_string_literal: true

# Model class for shoulda test
class UserProfile
  include ActiveModel::Model
  attr_accessor :website_url
  attr_accessor :email
  attr_accessor :absent_attribute
  attr_accessor :terms_of_service
  attr_accessor :some_value
  attr_accessor :some_text
  attr_accessor :zip_code

  validates :website_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp
  validates_absence_of :absent_attribute
  validates_acceptance_of :terms_of_service
  validates_confirmation_of :email
  validates :some_value, inclusion: [1, 2, 3]
  validates :some_text, length: { minimum: 10, maximum: 40, too_short: 'aaaa', too_long: 'bbbb' }
  validates :zip_code, length: { is: 7 }
end
