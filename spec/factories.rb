FactoryGirl.define do 
	factory :user do
		name			"Miguel Hartillio"
		email			"miguel@example.com"
		password	"foobar"
		password_confirmation "foobar"
	end
end