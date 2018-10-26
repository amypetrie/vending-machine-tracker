require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all of the snack names and prices associated with that vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "snack1", price: 1.50)
    snack2 = dons.snacks.create(name: "snack1", price: 1.30)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.price)
  end

  scenario 'they see the average price of snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "snack1", price: 1.50)
    snack2 = dons.snacks.create(name: "snack1", price: 1.30)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.price)
  end
end
