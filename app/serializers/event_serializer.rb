class EventSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :capacity, 
  :includes_food, :includes_drinks, :starts_at, :ends_at, :active

  has_many :reservations
end
