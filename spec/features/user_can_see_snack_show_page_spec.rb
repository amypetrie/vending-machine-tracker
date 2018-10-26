require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the name and price of the snack' do

    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")

    snack1 = dons.snacks.create(name: "snack1", price: 1.00)
    snack2 = dons.snacks.create(name: "snack2", price: 2.00)
    snack3 = dons.snacks.create(name: "snack3", price: 3.00)

    machine2 = owner.machines.create(location: "location1")
    machine2.snacks << snack1

  visit snack_path(snack1)

  expect(page).to have_content(snack1.name)
  expect(page).to have_content(snack1.price)
end

scenario 'they see locations of vending machine that carries the snack and that machines average snack price' do

  owner = Owner.create(name: "Sam's Snacks")
  dons = owner.machines.create(location: "Don's Mixed Drinks")

  snack1 = dons.snacks.create(name: "snack1", price: 1.00)
  snack2 = dons.snacks.create(name: "snack2", price: 2.00)
  snack3 = dons.snacks.create(name: "snack3", price: 3.00)

  machine2 = owner.machines.create(location: "location1")
  machine2.snacks << snack1

visit snack_path(snack1)
save_and_open_page
expect(page).to have_content(machine2.location)
expect(page).to have_content(dons.location)
expect(page).to have_content(dons.average_snack_price)
expect(page).to have_content(machine2.average_snack_price)
end

scenario 'they see count of items at each vending location' do

  owner = Owner.create(name: "Sam's Snacks")
  dons = owner.machines.create(location: "Don's Mixed Drinks")

  snack1 = dons.snacks.create(name: "snack1", price: 1.00)
  snack2 = dons.snacks.create(name: "snack2", price: 2.00)
  snack3 = dons.snacks.create(name: "snack3", price: 3.00)

  machine2 = owner.machines.create(location: "location1")
  machine2.snacks << snack1

visit snack_path(snack1)



end
end
