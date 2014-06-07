# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "user@example.com"
	password "12345678"    
	password_confirmation "12345678"    

	factory :admin_user do 
		admin true
	end
  end
end
