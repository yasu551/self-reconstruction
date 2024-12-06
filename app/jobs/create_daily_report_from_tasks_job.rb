class CreateDailyReportFromTasksJob < ApplicationJob
  queue_as :default

  def perform(user_id:)
    user = User.find_by id: user_id
    return if user.blank?

    daily_report = user.daily_reports.create_from_tasks!(user:)
    Turbo::StreamsChannel.broadcast_prepend_to [user, 'daily_reports'], target: 'daily_reports', partial: 'daily_reports/daily_report', locals: { daily_report: }
  end
end
