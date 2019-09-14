class CreateEvents < ActiveRecord::Migration[5.2]
  def change
  create_table :events do |t|
  		t.string :name
  		t.string :event_date
  		t.string :event_time
  		t.string :notes
  		t.string :submitted_by
  	end
  end

  def down
  	drop_table :events
  end
end
