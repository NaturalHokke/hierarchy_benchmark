class CreateClosureTreeModels < ActiveRecord::Migration[5.2]
  def change
    create_table :closure_tree_models do |t|
      t.string :name, null: false
      t.references :parent, foreign_key: { to_table: :closure_tree_models }

      t.timestamps
    end
  end
end
