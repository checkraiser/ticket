# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mticket do
    title "Make it really shinny"
    description "MyText is larger than 10 characters"
    project nil
  end
end
