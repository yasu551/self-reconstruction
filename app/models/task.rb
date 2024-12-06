class Task < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i[pending in_progress completed], predicates: true

  belongs_to :user

  validates :name, presence: true

  scope :default_order, -> { order(Arel.sql("deadline_on DESC NULLS LAST, id DESC")) }
end
