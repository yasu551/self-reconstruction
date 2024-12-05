class Goal < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :default_order, -> { order(id: :desc) }
end
