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
      create_head(val)
    else
      tail.next = Node.new(val)
      self.tail = tail.next
    end
    self.size += 1
  end

  def prepend(val)
    if size.eql?(0)
      create_head(val)
    else
      temp = Node.new(val)
      temp.next = head
      self.head = temp
    end
    self.size += 1
  end

  def at(index)
    return nil if index > last_index

    traverse { |node, counter| return node if counter.eql? index }
  end

  def pop
    return nil if size.eql?(0)
    return remove_size_one if size.eql?(1)

    self.tail = at(last_index - 1)
    last_node = tail.next
    tail.next = nil
    self.size -= 1
    last_node
  end

  def contains?(val)
    return false if size.eql?(0)

    traverse { |node| return true if node.val.eql? val }
    false
  end

  def find(val)
    return nil if size.eql?(0)

    traverse { |node, index| return index if node.val.eql? val }
    nil
  end

  def to_s
    return 'nil' if size.eql?(0)

    list_to_s = ''
    traverse { |node| list_to_s += "( #{node.val} ) -> " }
    "#{list_to_s}nil"
  end

  def inspect
    to_s
  end

  def insert_at(val, index)
    return nil if index.negative?
    return extend(index - last_index - 1, val) if index > last_index
    return prepend(val) if index.zero?

    insert_at_helper(val, index)
  end

  attr_reader :size, :head, :tail

  private

  def create_head(val)
    self.head = Node.new(val)
    self.tail = head
  end

  def remove_size_one
    last_node = tail
    self.head = self.tail = nil
    self.size -= 1
    last_node
  end

  def traverse(node = head)
    index = 0
    until node.nil?
      yield(node, index)
      node = node.next
      index += 1
    end
  end

  def last_index
    size - 1
  end

  def extend(num, val)
    num.times { append(nil) }
    append(val)
  end

  def insert_at_helper(val, index)
    prev_node = nil
    traverse do |node, counter|
      if counter.eql?(index)
        self.size += 1
        prev_node.next = Node.new(val)
        return prev_node.next.next = node
      end
      prev_node = node
    end
  end

  attr_writer :size, :head, :tail
end
