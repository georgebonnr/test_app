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

class Pet < ActiveRecord::Base
  belongs_to :owner, class_name: "Person"
end
