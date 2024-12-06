class KptBoard < ApplicationRecord
  belongs_to :user
  has_many :keep_actions, dependent: :destroy
  has_many :problem_actions, dependent: :destroy
  has_many :try_actions, dependent: :destroy

  validates :start_on, presence: true
  validates :end_on, presence: true

  scope :default_order, -> { order(id: :desc) }

  class << self
    def create_from_daily_reports(user:, start_on:, end_on:)
      keep_action_draft = ''
      problem_action_draft = ''
      try_action_draft = ''
      user.daily_reports.where(reported_on: start_on..end_on).each do |daily_report|
        keep_action_draft << daily_report.keep_action_draft
        problem_action_draft << daily_report.problem_action_draft
        try_action_draft << daily_report.try_action_draft
      end
      create(user:, start_on:, end_on:, keep_action_draft:, problem_action_draft:, try_action_draft:)
    end
  end
end
