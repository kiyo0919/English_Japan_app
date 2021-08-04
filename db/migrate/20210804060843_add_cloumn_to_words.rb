class AddCloumnToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :user_id, :integer
  end
end
