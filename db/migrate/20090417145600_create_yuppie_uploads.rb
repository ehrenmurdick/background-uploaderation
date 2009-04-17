class CreateYuppieUploads < ActiveRecord::Migration
  def self.up
    create_table :yuppie_uploads do |t|
      t.string :file_path

      t.timestamps
    end
  end

  def self.down
    drop_table :yuppie_uploads
  end
end
