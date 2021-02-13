class AddUserIdToAppointment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :user_id, :integer
  end
end
