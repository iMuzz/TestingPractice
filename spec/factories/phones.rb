FactoryGirl.define do
  factory :phone do  
    association :contact #tells factory girl to create a contact on the fly for this phone to belong to
    phone {'123-555-1234'}

    factory :home_phone do
      phone_type 'home'
    end
    factory :work_phone do
      phone_type 'work'
    end
    factory :mobile_phone do
      phone_type 'mobile'
    end
  end
end