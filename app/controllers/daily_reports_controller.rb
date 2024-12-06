class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: %i[ show edit update destroy ]

  # GET /daily_reports
  def index
    @daily_reports = current_user.daily_reports.default_order
  end

  # GET /daily_reports/1
  def show
  end

  # GET /daily_reports/new
  def new
    @daily_report = current_user.daily_reports.build
  end

  # GET /daily_reports/1/edit
  def edit
  end

  # POST /daily_reports
  def create
    @daily_report = current_user.daily_reports.build(daily_report_params)

    if @daily_report.save
      redirect_to daily_reports_path, notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daily_reports/1
  def update
    if @daily_report.update(daily_report_params)
      redirect_to daily_reports_path, notice: t("controllers.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /daily_reports/1
  def destroy
    @daily_report.destroy!
    redirect_to daily_reports_path, notice: "Daily report was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = current_user.daily_reports.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def daily_report_params
      params.expect(daily_report: [ :reported_on, :content, :keep_action_draft, :problem_action_draft, :try_action_draft ])
    end
end
