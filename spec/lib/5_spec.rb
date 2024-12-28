# frozen_string_literal: true

require 'spec_helper'
require '5'

RSpec.describe LongestPalindromicSubstring do
  it 'returns abacaba' do
    s = 'abacaba'

    result = described_class.new.longest_palindrome(s)

    expect(result).to eq('abacaba')
  end

  it 'returns aba' do
    s = 'babad'

    result = described_class.new.longest_palindrome(s)

    expect(result).to eq('bab')
  end

  it 'returns bb' do
    s = 'cbbd'

    result = described_class.new.longest_palindrome(s)

    expect(result).to eq('bb')
  end
end
