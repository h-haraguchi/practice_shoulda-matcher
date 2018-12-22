require 'rails_helper'

describe UserProfile do

  it { should allow_value('http://foo.com').for(:website_url) }
  it { should allow_value('http://bar.com').for(:website_url) }
  it do
    urls = %w[http://foo.com http://bar.com]
    should allow_values(*urls).for(:website_url)
  end

  it do
    urls = %w[buz]
    should_not allow_values(*urls).for(:website_url)
  end

  # with is_expected.to
  it { is_expected.to validate_presence_of(:website_url) }

  context 'secure_password' do
    it { is_expected.to have_secure_password }
  end
end
