require 'rails_helper'

# table_name: users
#
# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.integer "sign_in_count", default: 0, null: false
# t.datetime "current_sign_in_at"
# t.datetime "last_sign_in_at"
# t.string "current_sign_in_ip"
# t.string "last_sign_in_ip"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false



RSpec.describe User, type: :model do

  context "validation tests" do
    let(:user) { FactoryBot.create(:user) }

    it "ensures email is presence" do

      user.email = nil

      expect(user.save).to eq(false)
    end

    it "ensures password is presence" do

      user.password = nil

      expect(user.save).to eq(false)
    end

    it "should save successfully" do

      expect(user.save).to eq(true)
    end

  end

  context "scope tests" do
    let(:users) { create_list(:random_user, 10) }
    before(:each) do
     users.last(2).map { |u| u.update(sign_in_count: 20) }
     users.first(3).map { |u| u.update(created_at: 2.week.ago) }
    end

    it "should return highly active users (sign in more than 10 times)" do

      expect(User.active_usages_users.size).to eq(2)
    end

    it "should return users that never signed in" do

      expect(User.never_signed_in_users.size).to eq(8)
    end

    it "should return all users that signed in within this week" do

      expect(User.created_last_7days.size).to eq(7)
    end
    
  end
end
