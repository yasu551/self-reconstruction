class Task < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i[pending in_progress completed], predicates: true

  belongs_to :user

  validates :name, presence: true

  scope :default_order, -> { order(id: :desc) }
end
