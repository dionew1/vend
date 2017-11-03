require "rails_helper"

describe Machine do
  it "#average_snack_price" do
    owner = Owner.create(name: "Sal")
    machine = Machine.create(location: "School", owner: owner)
    snack1 = Snack.create(name: "Jerky", price: 5)
    snack2 = Snack.create(name: "Peanuts", price: 3)
    MachineSnack.create(machine: machine, snack: snack1)
    MachineSnack.create(machine: machine, snack: snack2)

    expect(machine.average_snack_price).to eq 4
  end
end
