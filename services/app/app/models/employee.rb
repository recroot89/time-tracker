# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :department

  has_many :workdays, dependent: :destroy
end
