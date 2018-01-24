FactoryBot.define do
  factory :v1_user, class: 'User' do
    email {Faker::Internet.email}
    password "MyString"
    password_confirmation "MyString"
  end
end
