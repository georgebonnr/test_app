class CreateArmadillos < ActiveRecord::Migration
  def change
    create_table :armadillos do |t|

      t.timestamps
    end
  end
end
