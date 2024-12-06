class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :daily_reports, dependent: :destroy
  has_many :kpt_boards, dependent: :destroy

  validates :name, presence: true
end
