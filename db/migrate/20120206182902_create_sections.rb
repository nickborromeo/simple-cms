class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
		
    	#foreign keys
    	t.references :page
    	
    	#table columns
    	t.string "name"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.string "content_type"
    	t.text "content"
      t.timestamps
    end
    #add indexes
    add_index("sections", "page_id")
  end
end
