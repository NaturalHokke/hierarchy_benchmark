class CreateRecursiveTags < ActiveRecord::Migration[6.1]
  def change
    create_table :recursive_tags do |t|
      t.string :name, null: false
      t.bigint :parent_id, index: true

      t.timestamps
    end
  end
end
