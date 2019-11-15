class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :to
      t.string :subject
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
