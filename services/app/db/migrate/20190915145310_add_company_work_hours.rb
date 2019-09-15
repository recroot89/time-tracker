# frozen_string_literal: true

class AddCompanyWorkHours < ActiveRecord::Migration[6.0]
  def change
    change_table :companies, bulk: true do |t|
      t.integer :work_hours, default: 8
      t.integer :work_days, default: 5
    end
  end
end
