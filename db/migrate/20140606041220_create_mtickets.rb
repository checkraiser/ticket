class CreateMtickets < ActiveRecord::Migration
  def change
    create_table :mtickets do |t|
      t.string :title
      t.text :description
      t.references :project, index: true

      t.timestamps
    end
  end
end
