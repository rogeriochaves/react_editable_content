class CreateEditableContentEditables < ActiveRecord::Migration
  def change
    create_table :editable_content_editables do |t|
      t.string :key
      t.text :text
      t.string :src

      t.timestamps
    end
  end
end