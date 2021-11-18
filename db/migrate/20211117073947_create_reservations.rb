class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :guest
      t.references :guest_detail
      t.date :start_date
      t.date :end_date
      t.string :currency, null: false
      t.integer :nights
      t.string  :status
      t.decimal :total_paid_amount, null: false
      t.decimal :payout_amount
      t.decimal :security_amount
      t.decimal :total_amount
      t.timestamps
    end
  end
end
