class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :status
      t.decimal :price
      t.integer :guests_count

      t.timestamps
    end
  end
end
