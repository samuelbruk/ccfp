class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :board
  belongs_to :connection, class_name: :User

  validates :user_id, presence: true
  validates :connection_id, presence: true
  validates :board_id, presence: true

  validate :maintain_uniqueness

  default_scope { order(created_at: :desc) }

  def maintain_uniqueness
    match = Relationship.find_by(user_id: self.user_id, connection_id: self.connection_id, board_id: self.board_id)
    if !!match
      errors.add(:uniqueness, "The relationship already exists")
    end
    true
  end
end
