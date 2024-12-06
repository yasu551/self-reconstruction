class KptBoard < ApplicationRecord
  belongs_to :user
  has_many :keep_actions, dependent: :destroy
  has_many :problem_actions, dependent: :destroy
  has_many :try_actions, dependent: :destroy

  validates :start_on, presence: true
  validates :end_on, presence: true
end
