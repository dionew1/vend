require 'rails_helper'

feature "User sees a snack show page" do
  scenario "user sees name" do
    owner = Owner.create(name: "Sal")
    machine1 = Machine.create(location: "School", owner: owner)
    machine2 = Machine.create(location: "School", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine1, snack: snack1)
    MachineSnack.create(machine: machine1, snack: snack2)
    MachineSnack.create(machine: machine2, snack: snack1)
    MachineSnack.create(machine: machine2, snack: snack2)

    visit snack_path(snack1)

    expect(page).to have_content(snack1.name)
  end

  scenario "user sees price" do
    owner = Owner.create(name: "Sal")
    machine1 = Machine.create(location: "School", owner: owner)
    machine2 = Machine.create(location: "School", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine1, snack: snack1)
    MachineSnack.create(machine: machine1, snack: snack2)
    MachineSnack.create(machine: machine2, snack: snack1)
    MachineSnack.create(machine: machine2, snack: snack2)

    visit snack_path(snack1)

    expect(page).to have_content(snack1.price)
  end

  scenario "user sees machine locations with snack" do
    owner = Owner.create(name: "Sal")
    machine1 = Machine.create(location: "School", owner: owner)
    machine2 = Machine.create(location: "Hospital", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine1, snack: snack1)
    MachineSnack.create(machine: machine1, snack: snack2)
    MachineSnack.create(machine: machine2, snack: snack1)
    MachineSnack.create(machine: machine2, snack: snack2)

    visit snack_path(snack1)

    expect(page).to have_content(machine1.location)
    expect(page).to have_content(machine2.location)
  end

  scenario "user sees average price of machine snacks" do
    owner = Owner.create(name: "Sal")
    machine1 = Machine.create(location: "School", owner: owner)
    machine2 = Machine.create(location: "Hospital", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine1, snack: snack1)
    MachineSnack.create(machine: machine1, snack: snack2)
    MachineSnack.create(machine: machine2, snack: snack1)
    MachineSnack.create(machine: machine2, snack: snack2)

    visit snack_path(snack1)

    expect(page).to have_content(machine1.average_snack_price)
    expect(page).to have_content(machine2.average_snack_price)
  end

  scenario "user sees count of different snacks" do
    owner = Owner.create(name: "Sal")
    machine1 = Machine.create(location: "School", owner: owner)
    machine2 = Machine.create(location: "Hospital", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine1, snack: snack1)
    MachineSnack.create(machine: machine1, snack: snack2)
    MachineSnack.create(machine: machine2, snack: snack1)
    MachineSnack.create(machine: machine2, snack: snack2)

    visit snack_path(snack1)

    expect(page).to have_content(machine1.snack_count)
    expect(page).to have_content(machine2.snack_count)
  end
end
