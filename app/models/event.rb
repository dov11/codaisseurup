class Event < ApplicationRecord
  belongs_to :user

validates :name, presence: true
validates :description, presence: true, length: {maximum: 500}
validates :starts_at, presence: true
validates :ends_at, presence: true
validates :ends_day_after_starts

def def ends_day_after_starts
  errors.add(:ends_at, "must be at least one day after start") if ends_at-starts_at<1
end

end
