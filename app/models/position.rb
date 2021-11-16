class Position < ApplicationRecord
  has_many :members, dependent: :nullify
  validates :role, presence: true
  validates :can_change_positions, inclusion: [true, false]
  validates :can_change_events, inclusion: [true, false]
  validates :can_change_roster, inclusion: [true, false]
  validates :member, inclusion: [true, false]
  validates :officer, inclusion: [true, false]
end
