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

  context 'validate_presence_of' do
    it { is_expected.to validate_presence_of(:website_url) }
  end

  context 'validate_absence_of' do
    it { is_expected.to validate_absence_of(:absent_attribute) }
  end

  context 'validate_acceptance_of' do
    it { is_expected.to validate_acceptance_of(:terms_of_service) }
  end

  context 'validate_confirmation_of' do
    it { is_expected.to validate_confirmation_of(:email) }
  end

  context 'validate_inclusion_of' do
    it do
      is_expected.to validate_inclusion_of(:some_value).in_array([1, 2, 3])
      is_expected.to validate_inclusion_of(:some_value).in_array([1, 2])
      is_expected.to validate_inclusion_of(:some_value).in_array([1, 3])
      is_expected.to validate_inclusion_of(:some_value).in_array([2, 3])
      is_expected.to validate_inclusion_of(:some_value).in_array([1])
      is_expected.to validate_inclusion_of(:some_value).in_array([2])
      is_expected.to validate_inclusion_of(:some_value).in_array([3])
      is_expected.not_to validate_inclusion_of(:some_value).in_array([0])
      is_expected.not_to validate_inclusion_of(:some_value).in_array([1, 2, 3, 4])
    end
  end

  context 'validate_length_of' do
    it 'short and long' do is_expected.to validate_length_of(:some_text).is_at_least(10).is_at_most(40).with_short_message('aaaa').with_long_message('bbbb') end
    it 'just' do is_expected.to validate_length_of(:zip_code).is_equal_to(7) end
    it '限界値分析もやってる' do
      # 10文字までだけど11文字で検証したらちゃんとバリデーションエラーになる
      # is_expected.to validate_length_of(:some_text).is_at_least(11)
    end
  end
end
