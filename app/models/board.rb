class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  # has_many :activities TODO
end
