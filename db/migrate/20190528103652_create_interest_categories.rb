class CreateInterestCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :interest_categories do |t|
      t.string :content

      t.timestamps
    end
  end
end
