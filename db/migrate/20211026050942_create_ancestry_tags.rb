class CreateAncestryTags < ActiveRecord::Migration[6.1]
  def change
    create_table :ancestry_tags do |t|
      t.string :name, null: false
      t.string :ancestry, index: true

      t.timestamps
    end
  end
end
