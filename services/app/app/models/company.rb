# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :departments, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates :work_hours, numericality: { greater_than_or_equal_to: 1, less_than: 25, only_integer: true }
  validates :work_days, numericality: { greater_than_or_equal_to: 1, less_than: 8, only_integer: true }
end
