class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos
  has_many :reservations, dependent: :destroy
  has_many :guests, through: :reservations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :ends_day_after_starts

  def ends_day_after_starts
    if ends_at.to_i < 1*3600*24+starts_at.to_i
      errors.add(:ends_at, "must be at least one day after start")
      # puts "not good"
      # else
      # puts "ok"
    end

  end

  after_initialize do |event|
    event.price = event.price ? event.price : 0.0
    event.includes_food=event.includes_food ? event.includes_food : false
    event.includes_drinks=event.includes_drinks ? event.includes_drinks : false

  end

  def bargain?
    price < 30
  end

  def self.order_by_price
    order :price
  end

end
