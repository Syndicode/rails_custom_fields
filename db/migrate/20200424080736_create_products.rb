class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price
      t.belongs_to :shop, null: false, foreign_key: { delete: :cascade }
      t.jsonb :custom_fields, null: false, default: {}, index: { using: :gin }

      t.timestamps
    end
  end
end
