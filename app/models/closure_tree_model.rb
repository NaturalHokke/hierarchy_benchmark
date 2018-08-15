class ClosureTreeModel < ApplicationRecord
  has_closure_tree
  belongs_to :parent
end
