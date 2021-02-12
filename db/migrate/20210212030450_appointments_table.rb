class AppointmentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :doctor
      t.string :time 
      t.string :clinic
      t.string :address
      t.string :phone
    end
  end
end
