class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.string :note, :limit => 50, :default => "" 
      t.references :favable, :polymorphic => true
      t.references :user
      t.timestamps
    end

    add_index :favorites, :favable_type
    add_index :favorites, :favable_id
    add_index :favorites, :user_id
  end

  def self.down
    drop_table :favorites
  end
end