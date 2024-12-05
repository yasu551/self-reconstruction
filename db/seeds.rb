# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_by!(email: 'user01@example.com')
%w[
フロントエンド技術の習得：6ヶ月以内にReactやVue.jsなどのモダンなJavaScriptフレームワークを1つマスターし、実際のプロジェクトに適用する
バックエンド言語の上達：1年以内にNode.jsやPythonなどのバックエンド言語を1つ習得し、RESTful APIを独力で設計・実装できるようになる
データベース管理スキルの向上：3ヶ月以内にSQLの基本を習得し、複雑なクエリを書けるようになる。さらに、NoSQLデータベースの基礎も学ぶ
バージョン管理システムの習熟：Gitの使用法を完全に理解し、1ヶ月以内にチーム開発でのブランチ戦略やマージ作業を効率的に行えるようになる
セキュリティ知識の獲得：半年以内にOWASP Top 10のセキュリティリスクを理解し、自身のプロジェクトに適用できるようになる
パフォーマンス最適化：3ヶ月以内にWebサイトのロード時間を現状から30%改善する技術を習得し、実際のプロジェクトで適用する
レスポンシブデザインの習得：2ヶ月以内にCSSフレームワーク（BootstrapやTailwind CSS）を1つマスターし、モバイルファーストの設計ができるようになる
アクセシビリティの向上：WAI-ARIAの基準を理解し、3ヶ月以内に既存のプロジェクトのアクセシビリティスコアを20%向上させる
テスト駆動開発（TDD）の実践：4ヶ月以内にJestやMochaなどのテストフレームワークを習得し、全ての新規機能開発でTDDを実践する
クラウドサービスの活用：6ヶ月以内にAWSやGCP、Azureなどのクラウドプラットフォームの1つを学び、Webアプリケーションのデプロイと管理ができるようになる
].each do |content|
  user.goals.find_or_create_by!(content:)
end
