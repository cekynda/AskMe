class Answer < ApplicationRecord
  belongs_to :question
  
  validates :answerer, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}
end
