class Task < ApplicationRecord
  validates :action_item, :deadline, :urgency, :impact, presence: true
  validates :action_item, length: {maximum: 20}
  validates :status, inclusion: { in: ['Waiting','Working on it','Need help', 'Done'],
    message: "%{value} is not a valid status, valid status are waiting, working on it, need help and done" }
  validates :urgency, inclusion: { in: ['Blocker','Critical','Medium', 'Low', 'Trivial'],
    message: "%{value} is not a valid urgency level, valid levels are Blocker, Critical, Medium, Low and Trivial" }
  validates :impact, inclusion: { in: ['Significant','Moderate','Low'],
    message: "%{value} is not a valid impact level, valid levels are Significant, Moderate and Low"}
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
 