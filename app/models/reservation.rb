class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guests_count, presence: true
  validate :below_four?

  def below_four?
    if guests_count>3
      errors.add(:guests_count, "must be blow 4")
    end
  end

  def set_price
    self.price = event.price*guests_count
  end
end
