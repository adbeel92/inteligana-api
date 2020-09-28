class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :level
  belongs_to :question_type
  has_many :answers
end
