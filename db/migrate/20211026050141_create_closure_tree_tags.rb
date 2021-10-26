class CreateClosureTreeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :closure_tree_tags do |t|
      t.string :name, null: false
      t.bigint :parent_id

      t.timestamps
    end
  end
end
