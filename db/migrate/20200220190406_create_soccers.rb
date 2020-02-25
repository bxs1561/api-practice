class CreateSoccers < ActiveRecord::Migration[6.0]
  def change
    create_table :soccers do |t|
      t.string :titles
      t.string :url
      t.binary :thumbnail
      t.date :game_date
      t.string :competition_name

      t.timestamps
    end
  end
end
