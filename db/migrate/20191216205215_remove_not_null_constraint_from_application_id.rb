class RemoveNotNullConstraintFromApplicationId < ActiveRecord::Migration[5.2]
  def change
    change_column :oauth_access_tokens, :application_id, :bigint, :null => true
  end
end
