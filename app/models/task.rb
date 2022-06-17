class Task < ApplicationRecord
  validates :action_item, :deadline, :priority, presence: true
  validates :action_item, length: {maximum: 20}
  validates :priority, inclusion: { in: ['Critical','Medium', 'Low', 'Trivial'],
    message: "%{value} is not a valid priority level, valid levels are Blocker, Critical, Medium, Low and Trivial" }
  validate :is_deadline_valid
  belongs_to :category
  belongs_to :user

  def is_deadline_valid
    if deadline != nil
      if deadline < Date.today
        errors.add(:deadline, 'cannot be past date')
      end
    end
  end
end