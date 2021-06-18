class CreateLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :labelings do |t|
      t.references :label, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
