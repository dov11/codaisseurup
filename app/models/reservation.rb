class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guests_count, presence: true, if: :below_four?

  def below_four?
    guests_count<4
  end
end
