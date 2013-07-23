# == Schema Information
#
# Table name: pets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  owner_id   :integer
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

# All about STI (Single Table Inheritance)
describe Pet do
  it "has a valid Factory" do
    expect( create( :pet ) ).to be_valid
  end

  it "retrieves pets of all types" do
    create( :pet )
    create( :dog )
    create( :cat )
    create( :armadillo )
    # expect( Pet.all.size ).to eq 4
  end

  it "retrieves only those types asked of it" do
    create( :pet )
    create( :dog )
    create( :cat )
    create( :cat )
    # expect( Cat.all.size ).to eq 2    
  end

  it "retains its 'type' in Java-speak" do
    create( :dog )
    # expect( Pet.all.first.class ).to eq Dog
  end
end
