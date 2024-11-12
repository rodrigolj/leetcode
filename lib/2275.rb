# frozen_string_literal: true

require 'pry'

class LargestCombinationBitwiseGreaterThanZero
  attr_reader :candidates

  def initialize(props)
    @candidates = props[:candidates]
  end

  def largest_combination
    sequences = {}

    for i in 0..23 do
      sequences[i] = 0
      candidates.each do | candidate |
        sequences[i] += candidate[i]
      end
    end

    sequences.values.select { |value| value > 0 }.max
  end
end
