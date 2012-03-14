class AddAdminUser < ActiveRecord::Migration
  def up
    User.create(first_name: "Admin", last_name: "User", email: "matt@logicxl.com", password: "english1", password_confirmation: "english1", admin: true, :confirmed_at => DateTime.now)
  end

  def down
  end
end
