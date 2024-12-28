# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require 'pry'

# Given a string s, return the longest
# palindromic substring in s
class LongestPalindromicSubstring
  extend T::Sig

  sig { params(str: String).returns(String) }
  def longest_palindrome(str)
    str = convert_to_odd_length str

    palindrome_radii = palindrome_radii_fast(str)

    coord = palindrome_radii.max_by { |_, v| v }

    result = str[T.must(coord)[0] - T.must(coord)[1]..T.must(coord)[0] + T.must(coord)[1]]
    T.must(result).delete '|'
  end

  private

  # Finds the longest palindrome radii with a naive implementation with O(n^2)
  # time complexity
  sig { params(str: String).returns(T::Hash[Integer, Integer]) }
  def palindrome_radii_slow(str)
    palindrome_radii = T.let({}, T::Hash[Integer, Integer])

    center = 0

    while center < str.length
      radius = 0

      while center - (radius + 1) >= 0 &&
            center + (radius + 1) < str.length &&
            str[center - (radius + 1)] == str[center + radius + 1]

        radius += 1
      end

      palindrome_radii[center] = radius

      center += 1
    end
    palindrome_radii
  end

  # Finds the longest palindrome radii with Manacher's algorithm
  sig { params(str: String).returns(T::Hash[Integer, Integer]) }
  def palindrome_radii_fast(str)
    palindrome_radii = {}

    center = 0
    radius = 0

    while center < str.length
      # At the start of the loop, radius is already set to a lower-bound
      # for the longest radius. In the first iteration, radius is 0, but
      # it can be higher on later iterations.
      #
      # Determine the longest palindrome starting at center - radius and
      # going to center + radius

      while center - (radius + 1) >= 0 &&
            center + (radius + 1) < str.length &&
            str[center - (radius + 1)] == str[center + (radius + 1)]
        radius += 1
      end

      # Save the radius of the longest palindrome in the hash
      palindrome_radii[center] = radius

      # Below, center is incremented.
      # If any precomputed values can be reused, they are.
      # Also, `radius` may be set to a value greater than `0`.

      old_center = center
      old_radius = radius
      center += 1

      # `radius`' default value will be `0`, if we reach the end of the
      # following loop.
      radius = 0

      while center <= old_center + old_radius
        # Because `center` lies inside the old palindrome and every
        # character inside a palindrome has a "mirrored" character
        # reflected across its center, we can use the data that was
        # precomputed for the `center's` mirrored point.

        mirrored_center = old_center - (center - old_center)
        max_mirrored_radius = old_center + old_radius - center

        if palindrome_radii[mirrored_center] < max_mirrored_radius
          # The palindrome centered at `mirrored_center` is entirely
          # contained in the palindrome centered at `old_center`, so
          # `mirrored_center` and `center` have the same sized palindrome.

          palindrome_radii[center] = palindrome_radii[mirrored_center]
          center += 1
        elsif palindrome_radii[mirrored_center] > max_mirrored_radius
          # The palindrome at `mirrored_center` extends beyond the
          # palindrome at `old_center`. The palindrome at `center` must
          # end at the edge of the `old_center` palindrome. Otherwise,
          # the palindrome at `old_center` would be bigger.

          palindrome_radii[center] = max_mirrored_radius
          center += 1
        else
          # Since the palindrome at `mirrored_center` ends exactly at
          # the edge of the palindrome centered at `old_center`, the
          # palindrome at center might be bigger. Set `radius` to the
          # minimum size of the palindrome at `center` so it doesn't
          # recheck necessarily.

          radius = max_mirrored_radius
          break
        end
      end
    end

    palindrome_radii
  end

  # Converts an even-length string into a odd length string
  sig { params(str: String).returns(String) }
  def convert_to_odd_length(str)
    return "|#{str.each_char.map { |c| c }.join('|')}|" if str.length.even?

    str
  end
end
