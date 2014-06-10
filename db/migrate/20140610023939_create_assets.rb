class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
    	t.string :asset
    	t.references :mticket
      t.timestamps
    end
    
  end
end
