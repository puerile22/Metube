class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :user
      t.belongs_to :video
      t.timestamps
    end
  end
end
