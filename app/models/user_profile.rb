# frozen_string_literal: true

# Model class for shoulda test
class UserProfile
  include ActiveModel::Model
  attr_accessor :website_url

  validates_format_of :website_url, with: URI::DEFAULT_PARSER.make_regexp
end
