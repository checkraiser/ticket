# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}
  sequence(:name) {|n| "username#{n}"}
  factory :user do
    name { generate(:name) }
    email { generate(:email) }
	password "12345678"    
	password_confirmation "12345678"    

	factory :admin_user do 
		admin true
	end
  end
end
