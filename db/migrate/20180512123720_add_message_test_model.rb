class AddMessageTestModel < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
    end
  end
end
