class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.references :snack, foreign_key: true, index: true
      t.references :machine, foreign_key: true, index: true
    end
  end
end
