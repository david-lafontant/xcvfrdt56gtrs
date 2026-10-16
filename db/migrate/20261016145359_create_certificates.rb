class CreateCertificates < ActiveRecord::Migration[8.0]
  def change
    create_table :certificates do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :certificate_id
      t.references :operator, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
