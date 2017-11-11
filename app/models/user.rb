class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :events, dependent: :destroy
has_many :reservations, dependent: :destroy
has_many :reserved_events, through: :reservations, source: :event

def has_profile?
  profile.present?&&profile.persisted?
end
def full_name
  profile.full_name
end
end
