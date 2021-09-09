class Question < ApplicationRecord
  include Visible

  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    created_at.strftime('%k:%M, %Y-%m-%d')
  end
end
