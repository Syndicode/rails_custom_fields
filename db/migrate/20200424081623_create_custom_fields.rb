class CreateCustomFields < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields do |t|
      t.string :label, null: false
      t.string :internal_name, null: false
      t.integer :field_type, default: 0, limit: 2, null: false
      t.text :description
      t.belongs_to :shop, null: false, foreign_key: { delete: :cascade }

      t.timestamps
    end
    add_index :custom_fields, %i[shop_id internal_name], unique: true
  end
end
