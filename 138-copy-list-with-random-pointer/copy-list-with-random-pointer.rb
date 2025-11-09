# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
    return if head.nil?
    
    main_tracker = []
    clone_tracker = []
    
    build_node(head, main_tracker, clone_tracker)
end

def build_node(node, main_tracker, clone_tracker)
    return nil if node.nil?
    return clone_tracker[main_tracker.index(node)] if main_tracker.include?(node)

    clone_node = Node.new(node.val)

    main_tracker << node
    clone_tracker << clone_node

    clone_node.next = build_node(node.next, main_tracker, clone_tracker)
    clone_node.random = build_node(node.random, main_tracker, clone_tracker)

    clone_node
end
