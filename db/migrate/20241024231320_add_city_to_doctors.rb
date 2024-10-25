class AddCityToDoctors < ActiveRecord::Migration[7.2]
  def change
    add_reference :doctors, :city, null: false, foreign_key: true
  end
end
