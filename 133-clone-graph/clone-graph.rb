# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
    tracker = []
    all_nodes = []

    collect_all_nodes(node, tracker, all_nodes)
    all_nodes = all_nodes.sort_by { |n| n.val }

    return if all_nodes.empty?

    tracker.clear
    build_nodes(node, tracker, all_nodes)
end

def collect_all_nodes(node, tracker, all_nodes)
    return if node.nil? || tracker.include?(node.val)

    tracker << node.val
    all_nodes << Node.new(node.val)
    node.neighbors.each { |n| collect_all_nodes(n, tracker, all_nodes) }
end

def build_nodes(node, tracker, all_nodes)
    return if tracker.include?(node.val)

    val = node.val
    target_node = all_nodes[val - 1]
    tracker << val

    node.neighbors.each do |n|
        neighbor_node = all_nodes[n.val - 1]
        target_node.neighbors << neighbor_node
        build_nodes(n, tracker, all_nodes)
    end

    target_node
end
