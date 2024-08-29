# frozen_string_literal: true

require_relative('node')

# A linked list data structure
class LinkedList
  def initialize(size = 0, val = nil)
    self.size = 0
    size.times { append(val) }
  end

  def append(val)
    if size.eql?(0)
      self.head = Node.new(val)
      self.tail = head
    else
      tail.next = Node.new(val)
      self.tail = tail.next
    end
    self.size += 1
  end

  def prepend(val); end

  def to_s
    return 'nil' if size.eql?(0)

    cur_node = head
    list_to_s = ''

    until cur_node.nil?
      list_to_s += "( #{cur_node.val} ) -> "
      cur_node = cur_node.next
    end
    "#{list_to_s}nil"
  end

  def inspect
    to_s
  end

  attr_reader :size, :head, :tail

  private

  attr_writer :size, :head, :tail
end
