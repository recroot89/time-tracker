# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :assignments, dependent: :destroy
  has_many :companies, through: :assignments

  validates :email, presence: true
  validates :name, presence: true

  def guest?
    false
  end
end
