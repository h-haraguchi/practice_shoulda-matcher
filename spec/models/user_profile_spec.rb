require 'rails_helper'

describe UserProfile do

  it { should allow_value('http://foo.com').for(:website_url) }
  it { should allow_value('http://bar.com').for(:website_url) }
end
