class ClosureTreeModel < ApplicationRecord
  has_closure_tree
  belongs_to :parent, optional: true, class_name: 'ClosureTreeModel'
end
