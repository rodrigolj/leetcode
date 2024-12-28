# frozen_string_literal: true

require 'spec_helper'
require '3'

RSpec.describe LongestSubstring do
  it 'returns 3 due to abc' do
    s = "abcabcbb"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(3)
  end

  it 'returns 1 due to b' do
    s = "bbbbb"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(1)
  end

  it 'returns 3 due to wke' do
    s = "pwwkew"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(3)
  end

  it 'returns 0 due to empty string' do
    s = ""

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(0)
  end

  it 'returns 2 due to au' do
    s = "au"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(2)
  end

  it 'returns 3 due to vdf' do
    s = "dvdf"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(3)
  end

  it 'returns 5 due to ilbkd' do
    s = "ckilbkd"

    result = described_class.new.length_of_longest_substring(s)

    expect(result).to eq(5)
  end
end
