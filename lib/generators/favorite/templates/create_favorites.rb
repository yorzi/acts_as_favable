class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.string :note, limit: 50, default: "" 
      t.references :favable, polymorphic: true, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end