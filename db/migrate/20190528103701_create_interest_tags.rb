class CreateInterestTags < ActiveRecord::Migration[5.2]
  def change
    create_table :interest_tags do |t|
      t.string :content
      t.references :interest_category, foreign_key: true

      t.timestamps
    end
  end
end
