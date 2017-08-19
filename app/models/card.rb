class Card < ApplicationRecord
  belongs_to :list
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :labels
  has_many :checklists, dependent: :destroy
end
