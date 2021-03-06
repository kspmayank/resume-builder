class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.text :password_hash
      t.string :mobile
      t.boolean :verified

      t.timestamps
    end
  end
end
