class AddUserIdToMtickets < ActiveRecord::Migration
  def change
    add_reference :mtickets, :user, index: true
  end
end
