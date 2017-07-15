require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

treeRoot = Node.new("tree root", 80)
heapRoot = Node.new("heap root", 80)
search_tree = BinarySearchTree.new(treeRoot)
min_heap = MinBinaryHeap.new(heapRoot)

n = 100000

Benchmark.bm do |bm|
  bm.report("tree insert") do
    for i in 1..n do
      new_node = Node.new("tree", Random.rand(100000))
      search_tree.insert(treeRoot, new_node)
    end
  end
  bm.report("heap insert") do
    for i in 1..n do
      new_node = Node.new("heap", Random.rand(100000))
      min_heap.insert(heapRoot, new_node)
    end
  end

  target_node = Node.new("target", 50000)
  search_tree.insert(treeRoot, target_node)
  min_heap.insert(heapRoot, target_node)

  bm.report("tree find") do
    search_tree.find(treeRoot, 50000)
  end
  bm.report("heap find") do
    min_heap.find(heapRoot, 50000)
  end

  bm.report("tree delete") do
    search_tree.delete(treeRoot, 50000)
  end
  bm.report("heap delete") do
    min_heap.delete(heapRoot, 50000)
  end
end
