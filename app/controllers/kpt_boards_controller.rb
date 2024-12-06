class KptBoardsController < ApplicationController
  before_action :set_kpt_board, only: %i[ show edit update destroy ]

  # GET /kpt_boards
  def index
    @kpt_boards = current_user.kpt_boards.default_order
  end

  # GET /kpt_boards/1
  def show
  end

  # GET /kpt_boards/new
  def new
    @kpt_board = current_user.kpt_boards.build
  end

  # GET /kpt_boards/1/edit
  def edit
  end

  # POST /kpt_boards
  def create
    @kpt_board = current_user.kpt_boards.create_from_daily_reports(user: current_user, start_on: kpt_board_params[:start_on], end_on: kpt_board_params[:end_on])

    if @kpt_board.save
      redirect_to kpt_boards_path, notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kpt_boards/1
  def update
    if @kpt_board.update(kpt_board_params)
      redirect_to kpt_boards_path, notice: t("controllers.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kpt_boards/1
  def destroy
    @kpt_board.destroy!
    redirect_to kpt_boards_path, notice: "Kpt board was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpt_board
      @kpt_board = current_user.kpt_boards.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def kpt_board_params
      params.expect(kpt_board: [ :start_on, :end_on, :keep_action_draft, :problem_action_draft, :try_action_draft ])
    end
end
