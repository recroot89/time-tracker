# frozen_string_literal: true

class RemoveCompanyFromEmployees < ActiveRecord::Migration[6.0]
  def change
    remove_reference :employees, :company, null: false, foreign_key: true
  end
end
