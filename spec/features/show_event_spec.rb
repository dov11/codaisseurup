require 'rails_helper'

describe "Viewing an individual event" do
  let(:event) { create :event }

  it "shows the event's details" do
    visit event_url(event)

    expect(page).to have_text("Includes food!")
    expect(page).to have_text("Includes drinks!")
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.name)
    expect(page).to have_text(event.starts_at.strftime("On %d/%m/%Y"))
    # expect(page).to have_text(room.bathroom_count)
    # expect(page).to have_text(room.listing_name)
    # expect(page).to have_text(room.description)
    # expect(page).to have_text(room.address)
  end
end
