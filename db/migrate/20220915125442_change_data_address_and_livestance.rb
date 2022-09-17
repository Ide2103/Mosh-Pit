class ChangeDataAddressAndLivestance < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :address, :integer
    change_column :users, :live_stance, :integer
  end
end
