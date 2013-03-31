class AddUsersToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :user_id, :integer
    #Add column to decks table with the column name user id and the type is integer
    add_index :decks, :user_id
    #Find decks based on the users
  end
end
