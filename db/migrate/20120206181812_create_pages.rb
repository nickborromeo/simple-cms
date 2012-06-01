class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	#foreign keys
    	t.integer "subject_id"
    	#table columns
		t.string "name"
		t.string "permalink"
		t.integer "position"
		t.boolean "visible", :default => false	
      t.timestamps
    end
    #add indexes
    add_index("pages", "subject_id")
	add_index("pages", "permalink")
    
  end
end
