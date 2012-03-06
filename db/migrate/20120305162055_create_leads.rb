class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :title
      t.string :phone
      t.string :post_id
      t.string :state
      t.string :email
      t.datetime :post_date
      t.string :original_url
      t.timestamps
    end
  end
end
