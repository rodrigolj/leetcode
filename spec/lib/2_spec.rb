# frozen_string_literal: true

require 'spec_helper'
require '2'

RSpec.describe AddTwoNumbers do
  it 'returns [7, 0, 8]'  do
    l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
    l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))

    result = described_class.new.add_two_numbers(l1, l2)

    expect(result).to eq([7, 0, 8])
  end


  it 'returns [0]'  do
    l1 = ListNode.new(0)
    l2 = ListNode.new(0)

    result = described_class.new.add_two_numbers(l1, l2)

    expect(result).to eq([0])
  end

  it 'returns [8,9,9,9,0,0,0,1]' do
    l1 = ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9)))))))
    l2 = ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9))))

    result = described_class.new.add_two_numbers(l1, l2)

    expect(result).to eq([8,9,9,9,0,0,0,1])
  end

end