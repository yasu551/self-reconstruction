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

  def update_keep_and_problem_drafts_by_ai!
    transaction do
      update_keep_action_draft_by_ai!
      update_problem_action_draft_by_ai!
    end
  end

  private

  def update_keep_action_draft_by_ai!
    client = OpenAiChatClient.new
    sample_user_content = <<~TEXT
      箇条書きで書かれた以下の行動リストから、良い行動を出力してください。その理由も出力してください。
      
      - 効率的なデータベース設計を行う
      - セキュリティを考慮した入力バリデーションを実装する
      - 大量の商品データを扱えるようにパフォーマンスを最適化する
      - データベースの正規化を無視する
      - SQLインジェクションの脆弱性を放置する
      - 商品情報の更新をリアルタイムに反映しない
    TEXT
    sample_assistant_content = <<~TEXT
      - 効率的なデータベース設計を行う
        - 理由: データベースの設計が効率的であることで、データの読み書きが高速に行えるため
      - セキュリティを考慮した入力バリデーションを実装する
        - 理由: セキュリティを考慮した入力バリデーションを実装することで、不正な入力を防ぐことができるため
      - 大量の商品データを扱えるようにパフォーマンスを最適化する
        - 理由: 大量の商品データを扱う際に、パフォーマンスを最適化することで、処理速度を向上させることができるため
    TEXT
    user_content = <<~TEXT
      以下の行動リストから、良い行動を出力してください。その理由も出力してください。
      
      #{content}
    TEXT
    messages = [
      { role: "user", content: sample_user_content },
      { role: "assistant", content: sample_assistant_content },
      { role: "user", content: user_content }
    ]
    keep_action_draft = client.chat(messages:)
    update!(keep_action_draft:)
  end

  def update_problem_action_draft_by_ai!
    client = OpenAiChatClient.new
    sample_user_content = <<~TEXT
      箇条書きで書かれた以下の行動リストから、悪い行動を出力してください。その理由も出力してください。
      
      - 効率的なデータベース設計を行う
      - セキュリティを考慮した入力バリデーションを実装する
      - 大量の商品データを扱えるようにパフォーマンスを最適化する
      - データベースの正規化を無視する
      - SQLインジェクションの脆弱性を放置する
      - 商品情報の更新をリアルタイムに反映しない
    TEXT
    sample_assistant_content = <<~TEXT
      - データベースの正規化を無視する
        - 理由: データベースの正規化を無視することで、データの整合性が保たれなくなるため
      - SQLインジェクションの脆弱性を放置する
        - 理由: SQLインジェクションの脆弱性を放置することで、データベースに不正なデータが挿入される可能性があるため
      - 商品情報の更新をリアルタイムに反映しない
        - 理由: 商品情報の更新をリアルタイムに反映しないことで、ユーザーが最新の情報を得られなくなるため
    TEXT
    user_content = <<~TEXT
      以下の行動リストから、悪い行動を出力してください。その理由も出力してください。
      
      #{content}
    TEXT
    messages = [
      { role: "user", content: sample_user_content },
      { role: "assistant", content: sample_assistant_content },
      { role: "user", content: user_content }
    ]
    problem_action_draft = client.chat(messages:)
    update!(problem_action_draft:)
  end

  def update_try_action_draft_by_ai!
    client = OpenAiChatClient.new
  end
end
