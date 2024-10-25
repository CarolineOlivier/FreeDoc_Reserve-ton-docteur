class AddCityToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_reference :appointments, :city, null: false, foreign_key: true
  end
end
