# frozen_string_literal: true

class StringCompressionIII
  attr_reader :word

  def initialize(params = {})
    @word = params[:word]
  end

  def whatever
    comp = []
    letter = nil
    count = 0
    index = 0

    word.each_char do |c|
      if letter.nil?
        letter = c
      end

      if letter == c && count < 9
        count += 1
        comp[index] = "#{count}#{letter}"
      elsif letter == c && count == 9
        comp[index] = "#{count}#{letter}"
        index += 1
        count = 1
        comp[index] = "#{count}#{letter}"
      elsif letter != c
        comp[index] = "#{count}#{letter}"
        letter = c
        count = 1
        index += 1
        comp[index] = "#{count}#{letter}"
      end
    end

    comp.join("")
  end
end
