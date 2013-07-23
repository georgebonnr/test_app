# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Address < ActiveRecord::Base
  # Associations
  has_one :person

  # Validations

  # Scopes

  # Instance methods

  # Class methods

  # Callbacks

end
