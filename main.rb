# frozen_string_literal: true

require_relative('lib/linkedlist')

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
p list.insert_at('Marble', 5)
p list.remove_at(5)

puts list
