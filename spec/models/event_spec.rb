require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it { is_expected.to validate_presence_of(:starts_at) }
  end
  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_name" do
    let!(:event1) { create :event, name: "Ab" }
    let!(:event2) { create :event, name: "Aa" }
    let!(:event3) { create :event, name: "Z" }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_name).to eq([event2, event1, event3])
    end
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.build(name: "Partey")

      expect(event.user).to eq(user)
    end
  end

  describe "association with reservation" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:reservation) { create :reservation, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end
  describe "association with category" do
    let(:event) { create :event }

    let(:category1) { create :category, name: "Bright", events: [event] }
    let(:category2) { create :category, name: "Clean lines", events: [event] }
    let(:category3) { create :category, name: "A Man's Touch", events: [event] }

    it "has categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

  # describe ".available?" do
   let(:host_user) { create :user, email: "host@user.com" }
   let(:guest_user) { create :user, email: "guest@user.com" }

   let(:event) { create :event, price: 20, user: host_user }

   let!(:existent_booking) {
     create :booking,
       event: event,
       starts_at: 2.days.from_now,
       ends_at: 6.days.from_now,
       user: guest_user
   }

   context "is available" do
     subject { event.available?(8.days.from_now, 10.days.from_now) }

     it "returns true" do
       expect(subject).to be true
     end
   end

   context "is not available" do
     subject { event.available?(4.days.from_now, 10.days.from_now) }

     it "returns false" do
       expect(subject).to be false
     end
   end
 end
end
