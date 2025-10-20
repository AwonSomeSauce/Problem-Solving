# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
    return if inorder.empty?

    root_value = preorder.shift
    index = inorder.index(root_value)

    root = TreeNode.new(root_value, nil, nil)
    root.left = build_tree(preorder, inorder[0...index])
    root.right = build_tree(preorder, inorder[(index + 1)..])

    root
end
