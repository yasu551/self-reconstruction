class DailyReport < ApplicationRecord
  belongs_to :user

  validates :reported_on, presence: true
  validates :user_id, uniqueness: { scope: %i[reported_on] }

  scope :default_order, -> { order(reported_on: :desc) }

  class << self
    def create_from_tasks!(user:)
      reported_on = Date.current
      tasks = user.tasks.where(updated_at: reported_on.all_day)
      content = ''
      transaction do
        tasks.default_order.each do |task|
          task.update_content_diff!
          done_content = <<~TEXT
          #{task.name} (#{task.status_text})
          #{task.content_diff}
        
        TEXT
          content << done_content
        end
        create!(user:, content:, reported_on:)
      end
    end
  end
end
