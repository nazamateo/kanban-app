class Category < ApplicationRecord
  validates :title, :details, presence: true
  validates :details, length: {maximum: 100}
  validates :title, uniqueness: true
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
