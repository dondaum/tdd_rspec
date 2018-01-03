class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # all scopes for business logic
  scope :active_usages_users, -> { where("sign_in_count >= ?", 10) }
  scope :never_signed_in_users, -> { where("sign_in_count = ?", 0) }
  scope :created_last_7days, -> { where("created_at >= ?", 1.week.ago) }

end
