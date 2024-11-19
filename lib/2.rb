# frozen_string_literal: true

require 'pry'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :_next

  def initialize(val = 0, _next = nil)
      @val = val
      @_next = _next
  end

  def list
    accumulate(self)
  end

  def next
    accumulate(_next)
  end

  def accumulate(current)
    current = current
    result = []

    while current != nil 
      result.push(current.val)
      current = current._next
    end

    result
  end
end

class AddTwoNumbers
  def add_two_numbers(l1, l2)
    result = []
    remainder = 0

    list1 = accumulate(l1)
    list2 = accumulate(l2)

    i = 0
    maximum = [list1.length, list2.length].max

    while i < maximum || remainder > 0
      sum_of_list_item = remainder + list1[i].to_i + list2[i].to_i
      result.push(sum_of_list_item.digits[0])
      remainder = sum_of_list_item.digits[1..-1].sum
      i += 1
    end

    result
  end

  def accumulate(current)
    current = current
    result = []

    while current != nil 
      result.push(current.val)
      current = current._next
    end

    result
  end
end