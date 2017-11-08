require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without a description" do
      event = Event.new(description: nil)
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid with a listing name longer than 500 characters" do
      event = Event.new(description: Faker::Lorem.characters(510))
      event.valid?
      expect(event.errors).to have_key(:description)
    end
  end
end
