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

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
