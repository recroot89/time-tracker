# frozen_string_literal: true

class CreateWorkdays < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_workdays do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :hours
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end

    add_index :employee_workdays, [:year, :month, :day], unique: true
  end
end
