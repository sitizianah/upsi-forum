class Question < ApplicationRecord

  acts_as_votable
  
  belongs_to :user
  has_many :answers
  validates_presence_of :title
end
