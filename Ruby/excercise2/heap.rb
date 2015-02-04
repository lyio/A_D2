class Heap
  def initialize
    @heap = []
    @data = []
  end

  def add(e)
    @data.push e
    @heap.push(@data.length - 1)
    reorganize_bottom(e)
  end

  def read
    e = @data.delete_at(@heap.shift) #removing element
    reorganize_top
    e
  end


  def tree
    @heap.map do |i|
      @data[i]
    end
  end

  private
  def reorganize_top
    #get last element and put it in front
    lastIndex = @heap.pop
    element = @data[lastIndex]
    current = 1
    @heap.insert(0, lastIndex)
    while current < @heap.length
      leftChild = 2 * current + 1
      rightChild = leftChild + 1
      puts "idx left child: #{leftChild}"
      puts "idx left child: #{rightChild}"
      if @data[leftChild] and @data[leftChild] > element
        current = leftChild
      end
      if @data[rightChild] and @data[rightChild] > element
      end
    end
  end

  def reorganize_bottom(e)
    currentIndex = @heap.length - 1
    while currentIndex > 0  && @data[currentIndex / 2] < e
      swap(@heap, currentIndex, currentIndex / 2)
      currentIndex = currentIndex / 2
    end
    currentIndex
  end

  def swap(heap, i, j)
    temp =  heap[i]
    heap[i] = heap[j]
    heap[j] = temp
  end
end
