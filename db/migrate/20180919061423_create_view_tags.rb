class CreateViewTags < ActiveRecord::Migration
  def change
    create_table :view_tags do |t|
      t.integer :prototype_id, foreign_key: true
      t.integer :tag_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
