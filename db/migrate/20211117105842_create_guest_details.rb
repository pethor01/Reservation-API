class CreateGuestDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_details do |t|
      t.integer :number_of_guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.text :description
      t.timestamps
    end
  end
end
