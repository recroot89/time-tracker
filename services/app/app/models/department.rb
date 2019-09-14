# frozen_string_literal: true

class Department < ApplicationRecord
  belongs_to :company
end
