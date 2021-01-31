class AddReferencesToGuests < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :podcast, foreign_key: true
  end
end
