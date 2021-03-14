class Task < ApplicationRecord
  belongs_to :user, optional: true
  enum status: { open: 'open', closed: 'closed' }

  validates :title, :description, presence: true

  scope :unassigned, -> { where(user_id: nil) }

end
