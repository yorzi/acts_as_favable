class CreateFavorites < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def change
    create_table :favorites do |t|
      t.string :note, limit: 50, default: ""
      t.references :favable, polymorphic: true, null: false, index: true
      t.references :user, null: true, index: true
      t.timestamps
    end
  end
end
