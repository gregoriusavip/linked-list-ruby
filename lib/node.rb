# frozen_string_literal: true

# Provide structure for a node
class Node
  def initialize(val)
    self.next = nil
    self.val = val
  end

  attr_accessor :val, :next
end
