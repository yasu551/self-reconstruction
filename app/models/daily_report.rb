class DailyReport < ApplicationRecord
  belongs_to :user

  validates :reported_on, presence: true
  validates :user_id, uniqueness: { scope: %i[reported_on] }

  scope :default_order, -> { order(reported_on: :desc) }
end
