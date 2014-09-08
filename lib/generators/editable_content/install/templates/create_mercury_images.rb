class CreateMercuryImages < ActiveRecord::Migration
  def change
    create_table :mercury_images do |t|
      t.attachment :image
      t.timestamps
    end
  end
end