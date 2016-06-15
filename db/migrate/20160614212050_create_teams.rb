class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams, id: false) do |t|
		#t.integer :id
		t.column :id, 'int PRIMARY KEY'
		t.string :name
		t.string :school
		t.string :city
		t.string :state
		t.string :country
		t.text :description

		t.timestamps null: false
	  
    end
  end
end
