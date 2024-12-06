class ProblemAction < ApplicationRecord
  belongs_to :kpt_board

  validates :content, presence: true
end
