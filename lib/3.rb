# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require 'pry'

class LongestSubstring
  extend T::Sig

  sig { params(s: String).returns(Integer) }
  def length_of_longest_substring(s)
    return 0 if s.empty?
    return 1 if s.length == 1

    results = combine_strings(s)

    T.must(results.map(&:length).max)
  end

  sig { params(s: String).returns(T::Array[String]) }
  def combine_strings(s)
    results = T.let([], T::Array[String])
    current = T.cast([], T::Array[String])

    s.chars.each_with_index do |char, idx|
      if char == prev_char(s, idx)
        results.push(current.dup)
        current = T.cast([], T::Array[String])
      elsif current.length > 1 && current.include?(char)
        results.push(current.dup)
        shift_pos = T.must(current.index(char)) + 1
        current.shift(shift_pos)
      end

      current.push(char)
    end

    results.push(current)
  end

  sig { params(s: String, i: Integer).returns(T.nilable(String)) }
  def prev_char(s, i)
    i.positive? ? s[i - 1] : nil
  end

  # sig { params(s: String, i: Integer).returns(T.nilable(String)) }
  # def next_char(s, i)
  #   s[i + 1]
  # end
end
