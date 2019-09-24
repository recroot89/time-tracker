# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :department

  has_many :workdays, dependent: :destroy
end
