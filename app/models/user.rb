class User < ApplicationRecord
  has_secure_password

  has_many :boards, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :connections, through: :relationships

  has_many :reverse_relationships, class_name: :Relationship, foreign_key: :connection_id
  has_many :inverse_connections, through: :reverse_relationships, source: :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
