class CreateDateIntervals < ActiveRecord::Migration
  def change
    create_table :scheduled_dates do |t|
      t.string  :day
      t.string  :event_type_name
      t.string  :holiday_name
      t.integer :user_id
    end
  end
end
