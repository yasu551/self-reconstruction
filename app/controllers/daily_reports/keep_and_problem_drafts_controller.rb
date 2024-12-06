class DailyReports::KeepAndProblemDraftsController < DailyReports::ApplicationController
  def create
    CreateKeepAndProblemDraftsJob.perform_later(daily_report_id: @daily_report.id)
    return
  end
end