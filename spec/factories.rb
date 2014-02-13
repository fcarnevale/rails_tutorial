FactoryGirl.define do 
  factory :user do
    name      "Miguel Hartilio"
    email     "miguel@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end