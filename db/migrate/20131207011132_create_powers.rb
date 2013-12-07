class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
