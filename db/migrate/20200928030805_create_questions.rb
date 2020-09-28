class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :text
      t.references :question_type
      t.references :level
      t.references :topic

      t.timestamps
    end
  end
end
