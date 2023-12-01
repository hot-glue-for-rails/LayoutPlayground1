class AddColumnsToThings < ActiveRecord::Migration[7.0]
  def change
    add_column :things, :aaa, :string
    add_column :things, :bbb, :integer
    add_column :things, :ccc, :text
    add_column :things, :ddd, :date
    add_column :things, :eee, :datetime
  end
end
