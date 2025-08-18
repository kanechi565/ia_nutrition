class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :float
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
