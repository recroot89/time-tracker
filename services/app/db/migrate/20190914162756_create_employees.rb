# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :personnel_number
      t.string :tin, unique: true
      t.date :birth_date
      t.date :begin_date
      t.date :end_date, default: nil
      t.references :company, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end

    add_index :employees, :personnel_number, unique: true
  end
end
