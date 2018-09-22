class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_list, index: true

      t.timestamps null: false
    end
  end
end
