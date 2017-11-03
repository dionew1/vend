require 'rails_helper'

feature "User visits a specific vending machine page" do
  scenario "user sees name of all the snacks in machine with price" do
    owner = Owner.create(name: "Sal")
    machine = Machine.create(location: "School", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine, snack: snack1)
    MachineSnack.create(machine: machine, snack: snack2)

    visit machine_path(machine)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end

  scenario "user sees a an average price for all of the snacks" do
    owner = Owner.create(name: "Sal")
    machine = Machine.create(location: "School", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine, snack: snack1)
    MachineSnack.create(machine: machine, snack: snack2)

    visit machine_path(machine)

    expect(page).to have_content("Average Price of Snacks: ")
    expect(page).to have_content("$4.")
  end
end
