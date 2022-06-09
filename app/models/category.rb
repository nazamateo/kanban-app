class Category < ApplicationRecord
  validates :project_title, :details, presence: true
  validates :details, length: {maximum: 100}
  validates :project_title, uniqueness: true
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
