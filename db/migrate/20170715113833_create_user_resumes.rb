class CreateUserResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_resumes do |t|
      t.references :user, foreign_key: true
      t.string :template
      t.text :content

      t.timestamps
    end
  end
end
