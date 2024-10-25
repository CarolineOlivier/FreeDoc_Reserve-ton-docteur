class RemoveSpecialtyFromDoctors < ActiveRecord::Migration[7.2]
  def change
    remove_column :doctors, :specialty, :string
  end
end
