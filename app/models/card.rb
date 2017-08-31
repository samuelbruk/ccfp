class Card < ApplicationRecord
  mount_uploader :card_attachment, CardAttachmentUploader

  belongs_to :list
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :labels
  has_many :checklists, dependent: :destroy

  default_scope { order(created_at: :asc) }

end
