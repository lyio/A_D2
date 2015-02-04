require_relative 'heap.rb'
h = Heap.new

#data = [1, 2, 5, 6, -1, 8, 11]
data = [1,2,3,4,5,6]

File.open("daten.txt", "r") do |infile|
  while (line = infile.gets)
    h.add line.to_i
  end
end

# printing tree
puts h.tree.to_s

#read highest priority element
#puts h.read

#print tree again
puts h.tree.to_s
