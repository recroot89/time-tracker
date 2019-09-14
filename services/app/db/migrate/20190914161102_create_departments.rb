# frozen_string_literal: true

class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description
      t.string :code
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end

    add_index :departments, :code, unique: true
  end
end
