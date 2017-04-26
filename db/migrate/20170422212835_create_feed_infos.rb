class CreateFeedInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_infos do |t|
      t.string :feed_publisher_name
      t.string :feed_publisher_url
      t.string :feed_timezone
      t.string :feed_lang
      t.string :feed_version

      t.timestamps
    end
  end
end
