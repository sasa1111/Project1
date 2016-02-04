class CreateArticles < ActiveRecord::Migration
  def change
    reversible do |dir|
    create_table :articles do |t|
        
      t.string :title 
      t.text :text
      t.references :account, index: true, foreign_key: true
      t.timestamps null: false
      end
    end
  end
end
