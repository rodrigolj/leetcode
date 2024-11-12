# frozen_string_literal: true

require 'spec_helper'
require '2275'

RSpec.describe LargestCombinationBitwiseGreaterThanZero do
  it 'returns 10' do
    candidates = [16,16,48,71,62,12,24,14,17,18,19,20,10000]

    result = described_class.new({candidates:}).largest_combination

    expect(result).to be(10)
  end

  it 'returns 4' do
    candidates = [16,17,71,62,12,24,14]

    result = described_class.new({candidates:}).largest_combination

    expect(result).to be(4)
  end
end
