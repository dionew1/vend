require 'rails_helper'

feature "User visits a specific vending machine page" do
  scenario "user sees name of all the snacks in machine with price" do
    owner = Owner.create(name: "Sal")
    machine = Machine.create(location: "School", owner: owner)

    visit machine_path(machine)

    expect(page).to have_content("Jerky")
    expect(page).to have_content("$4.00")
  end
end
