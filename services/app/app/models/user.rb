# frozen_string_literal: true

class User < ApplicationRecord
  ADMINS = ASDF.admins.split(';').freeze

  has_secure_password

  has_many :assignments, dependent: :destroy
  has_many :companies, through: :assignments

  validates :email, presence: true
  validates :name, presence: true

  def guest?
    false
  end

  def admin?
    ADMINS.include? email
  end
end
