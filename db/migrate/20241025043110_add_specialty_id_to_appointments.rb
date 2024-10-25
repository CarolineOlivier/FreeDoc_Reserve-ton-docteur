class AddSpecialtyIdToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :specialty_id, :integer
  end
end
