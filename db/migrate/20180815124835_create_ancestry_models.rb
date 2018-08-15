class CreateAncestryModels < ActiveRecord::Migration[5.2]
  def change
    create_table :ancestry_models do |t|
      t.string :name, null: false
      t.string :ancestry, index: true

      t.timestamps
    end
  end
end
