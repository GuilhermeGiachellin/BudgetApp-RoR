class CreateJoinTableGroupEntity < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :entities do |t|      
      t.index [:entity_id, :group_id]
    end
  end
end
