# frozen_string_literal: true
# typed: true

# An Array is an ordered, integer-indexed collection of objects, called elements. Any object (even another array) may be an array element, and an array can contain objects of different types.
class Array
  extend T::Sig
  extend T::Generic

  sig do
    type_parameters(:Elem)
      .params(arg0: BasicObject)
      .returns(T::Array[T.type_parameter(:Elem)])
  end
  def push(*arg0); end
end
