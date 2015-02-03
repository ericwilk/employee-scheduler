class CreateEventTypesTable < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string  :name
    end
  end
end
