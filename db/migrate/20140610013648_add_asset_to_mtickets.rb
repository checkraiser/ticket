class AddAssetToMtickets < ActiveRecord::Migration
  def change
    add_column :mtickets, :asset, :string
  end
end
