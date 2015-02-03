class CreateDateIntervals < ActiveRecord::Migration
  def change
    create_table :scheduled_dates do |t|
      t.timestamps
      t.string  :day
    end
    create_table :blackout_dates do |t|
      t.references :resource, :polymorphic => true
      t.references :user
    end
    create_table :holidays do |t|
      t.references :resource, :polymorphic => true
      t.string  :scope
      t.string  :name
    end
  end
end
