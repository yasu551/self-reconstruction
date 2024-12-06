class Task < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i[pending in_progress completed], predicates: true

  belongs_to :user

  validates :name, presence: true

  scope :default_order, -> { order(Arel.sql("deadline_on DESC NULLS LAST, id DESC")) }

  def update_content_diff!
    client = OpenAiChatClient.new
    sample_user_content = <<~TEXT
      昨日と今日のTodoリストの違いから、今日完了したタスクを出力してください。
      
      昨日のTodoリスト
      - [x] 商品データベースの設計と実装
      - [ ] 効率的なデータベース設計を行う
      - [ ] セキュリティを考慮した入力バリデーションを実装する
      - [ ] 大量の商品データを扱えるようにパフォーマンスを最適化す

      今日のTodoリスト
      - [x] 商品データベースの設計と実装
      - [x] 効率的なデータベース設計を行う
      - [x] セキュリティを考慮した入力バリデーションを実装する
      - [x] 大量の商品データを扱えるようにパフォーマンスを最適化す
    TEXT
    sample_assistant_content = <<~TEXT
      - 効率的なデータベース設計を行う
      - セキュリティを考慮した入力バリデーションを実装する
      - 大量の商品データを扱えるようにパフォーマンスを最適化す
    TEXT
    user_content = <<~TEXT
      昨日と今日のTodoリストの違いから、今日完了したタスクを出力してください。

      昨日のTodoリスト
      #{yesterday_content}

      今日のTodoリスト
      #{content}
    TEXT
    messages = [
      { role: "user", content: sample_user_content },
      { role: "assistant", content: sample_assistant_content },
      { role: "user", content: user_content }
    ]
    content_diff = client.chat(messages:)
    update!(content_diff:)
  end
end
