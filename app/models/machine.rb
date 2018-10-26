class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snackmachines
  has_many :snacks, through: :snackmachines

  def average_snack_price
    price = snacks.average(:price)
  end
end
