class CreateClosureTreeTagHierarchies < ActiveRecord::Migration[6.1]
  def change
    create_table :closure_tree_tag_hierarchies, id: false do |t|
      t.bigint :ancestor_id, null: false
      t.bigint :descendant_id, null: false
      t.bigint :generations, null: false
    end

    add_index :closure_tree_tag_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "closure_tree_tag_anc_desc_idx"

    add_index :closure_tree_tag_hierarchies, [:descendant_id],
      name: "closure_tree_tag_desc_idx"
  end
end
