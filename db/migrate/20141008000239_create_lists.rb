class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :playlist
      t.belongs_to :video
      t.timestamps
    end
  end
end
