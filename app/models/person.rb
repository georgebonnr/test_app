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

class Person < ActiveRecord::Base
  # Associations
  has_many :pets
  belongs_to :address

  # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true

  # Scopes

  # Virtual Attributes
  def full_name
    first_name << " " << last_name
  end

  def full_name=( full_name )
    name = full_name.split( ' ' )
    self.first_name = name.first
    self.last_name = name.last 
  end

  # Instance Methods
  def phone
    read_attribute( :phone ).tr( '^0-9', '' )
  end

  def phone=( phone_number )
    write_attribute( :phone, phone_number.tr( '^0-9', '' ) )
  end

  # Class Methods

  # Callbacks
end
