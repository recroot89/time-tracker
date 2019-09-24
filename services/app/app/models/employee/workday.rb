# frozen_string_literal: true

class Employee::Workday < ApplicationRecord
  belongs_to :employee
end
