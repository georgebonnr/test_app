# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  address_id :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Person do
  it "has a valid Factory" do
    expect( create( :person ) ).to be_valid
  end

  it "accepts a full_name and splits it" do
    p = create( :person, full_name: "Mickey Mantle" )
    # expect( p.first_name ).to eq "Mickey"
    # expect( p.last_name ).to eq "Mantle"
  end

  it "returns a full_name by joining first_name and last_name" do
    p = create( :person, first_name: "Mickey", last_name: "Mantle")
    # expect( p.full_name ).to eq "Mickey Mantle"
  end

  it "updates with virtual attributes" do
    p = create( :person )

    # expect( p.first_name ).to eq "John"
    # expect( p.last_name ).to eq "Doe"
    p.update( full_name: "Mickey Mantle" )
    p.reload
    # expect( p.first_name ).to eq "Mickey"
    # expect( p.last_name ).to eq "Mantle"
  end

  it "returns phone as only numbers" do
    p = create( :person, phone: "(941) 716-6909" )
    # expect( p.phone ).to eq "9417166909"
  end

  it "saves formatted phone numbers as digits only" do
    p = create( :person, phone: "(941) 716-6909" )
    # binding.pry
  end
end 
