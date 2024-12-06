class KeepAction < ApplicationRecord
  belongs_to :kpt_board
  belongs_to :try_action, optional: true

  validates :content, presence: true
end
