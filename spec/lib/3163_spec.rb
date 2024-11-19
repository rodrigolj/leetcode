# frozen_string_literal: true

require 'spec_helper'
require '3163'

RSpec.describe StringCompressionIII do
  it 'returns case 1 result' do
    word = "abcde"
    expected = "1a1b1c1d1e"

    result = described_class.new({word:}).whatever

    expect(result).to eq(expected)
  end

  it 'returns case 2 result' do
    word = "aaaaaaaaaaaaaabb"
    expected = "9a5a2b"

    result = described_class.new({word:}).whatever
    expect(result).to eq(expected)
  end

  it 'returns case 3 result' do
    word = "mrm"
    expected = "1m1r1m"


    result = described_class.new({word:}).whatever
    expect(result).to eq(expected)
  end
end
