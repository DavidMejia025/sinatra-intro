class CreateEntryTags < ActiveRecord::Migration[5.0]
  def change
  	create_table :entry_tags do |t|
  		t.integer :tag_id
  		t.integer :entry_id

  		t.timestamps
  	end
  end
end
