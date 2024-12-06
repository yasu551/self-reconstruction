class DailyReports::ApplicationController < ApplicationController
  before_action :set_daily_report

  private

  def set_daily_report
    @daily_report = current_user.daily_reports.find(params.expect(:daily_report_id))
  end
end
