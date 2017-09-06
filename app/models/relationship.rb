class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :connection, class_name: :User

  validates :user_id, presence: true
  validates :connection_id, presence: true
end
