class CreateKeepAndProblemDraftsJob < ApplicationJob
  queue_as :default

  def perform(daily_report_id:)
    daily_report = DailyReport.find_by(id: daily_report_id)
    return if daily_report.blank?

    daily_report.update_keep_and_problem_drafts_by_ai!
    Turbo::StreamsChannel.broadcast_update_to [daily_report.user, daily_report], target: "daily_report_#{daily_report.id}", partial: 'daily_reports/form', locals: { daily_report: }
  end
end
