class CreateViewTags < ActiveRecord::Migration
  def change
    create_table :view_tags do |t|
      t.references :prototype, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
