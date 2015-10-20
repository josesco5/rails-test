class CreateWebUrls < ActiveRecord::Migration
  def change
    create_table :web_urls do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
