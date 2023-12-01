class CreateThings < ActiveRecord::Migration[7.0]
  def change
    create_enum :persona_type, %w[admin user]
    create_enum :expected_result_type, %w[success failure]
    create_table :things do |t|
      t.string :name
      t.text :description
      t.date :executed_on
      t.datetime :concieved_of_at
      t.time :will_be_at
      t.enum :persona, enum_type: :persona_type
      t.string :forecast
      t.integer :person_id
      t.date :when_at
      t.text :background_details
      t.enum :expected_result, enum_type: :expected_result_type
      t.boolean :will_call
      t.float :amount

      t.timestamps
    end
  end
end
