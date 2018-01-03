require 'faker'

FactoryBot.define do

  factory :user do

    email "test@test2.com"
    password "testtest"
    password_confirmation "testtest"

  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password "testtest"
    password_confirmation "testtest"
  end

end
