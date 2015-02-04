require_relative 'binary_tree.rb'

data = [54, 22, 76, 40, 15, 18, 4, 13, 16, 77, 28, 38]
t = BinaryTree.new

data.each do |d|
  t.add(d)
end

puts t.find(t.root, 22)
puts "deleted: #{t.delete(22)}"

