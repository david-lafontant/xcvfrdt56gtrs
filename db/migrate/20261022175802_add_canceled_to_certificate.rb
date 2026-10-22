class AddCanceledToCertificate < ActiveRecord::Migration[8.0]
  def up
    add_column :certificates, :canceled, :boolean, null: false, default: false
  end

  def down
    remove_column :certificates, :canceled
  end
end
