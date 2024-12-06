class TryAction < ApplicationRecord
  belongs_to :kpt_board
  belongs_to :problem_action, optional: true

  validates :content, presence: true
end
