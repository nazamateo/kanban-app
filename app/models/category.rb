class Category < ApplicationRecord
  validates :title, :details, presence: true, uniqueness: true
  validates :details, length: {maximum: 100}
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
