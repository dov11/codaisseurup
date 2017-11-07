class Event < ApplicationRecord
  belongs_to :user

validates :name, presence: true
validates :description, presence: true, length: {maximum: 500}
validates :starts_at, presence: true
validates :ends_at, presence: true
validate :ends_day_after_starts

def ends_day_after_starts
  errors.add(:ends_at, "must be at least one day after start") if ends_at - starts_at < 1
end

after_initialize do |event|
  event.price = event.price ? event.price : 0.0
  event.includes_food=event.includes_food ? event.includes_food : false
  event.includes_drinks=event.includes_drinks ? event.includes_drinks : false
end

end
