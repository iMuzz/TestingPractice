FactoryGirl.define do
  factory :phone do  
    association :contact #tells factory girl to create a contact on the fly for this phone to belong to
    phone '123-555-1234'
    phone_type 'home'
  end
end