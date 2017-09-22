class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :relationships, dependent: :destroy
  belongs_to :user
  # has_many :activities TODO

  validates :user_id, presence: true

  default_scope { order(created_at: :desc) }

end
