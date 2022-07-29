class ChangeColumnInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :email, :description
    change_column :items, :description, :text

  end
end
