# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
end
