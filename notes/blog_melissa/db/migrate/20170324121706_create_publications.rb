class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.belongs_to :entry, index: true
      t.belongs_to :tag, index: true


      t.timestamp
    end
  end
end
