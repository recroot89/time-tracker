# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :departments, dependent: :destroy
  has_many :employees, dependent: :destroy
end
