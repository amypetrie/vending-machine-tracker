require 'rails_helper'

RSpec.describe Snackmachine, type: :model do
  it {should belong_to :snack}
  it {should belong_to :snack}
end
