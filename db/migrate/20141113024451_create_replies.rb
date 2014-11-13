class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :message
      t.belongs_to :post
      
      t.timestamps
    end
  end
end
