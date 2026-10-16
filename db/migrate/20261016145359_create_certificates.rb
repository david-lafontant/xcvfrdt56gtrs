class CreateCertificates < ActiveRecord::Migration[8.0]
  def change
    create_table :certificates do |t|
      t.string :first_name,  null: false
      t.string :last_name,  null: false
      t.string :company,  null: false
      t.string :certificate_id,  null: false
      t.references :operator, null: false, foreign_key: {to_table: :users}
      t.text :description,  null: false


      t.timestamps
    end
  end
end
