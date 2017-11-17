class AddColumnOwnerIdToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :owner_id, :integer
  end
end
