class DailyReports::TryActionDraftsController < DailyReports::ApplicationController
  def create
    CreateTryActionDraftJob.perform_later(daily_report_id: @daily_report.id)
    head :ok
  end
end
