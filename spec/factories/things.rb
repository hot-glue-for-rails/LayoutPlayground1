FactoryBot.define do
  factory :thing do
    name { "MyString" }
    description { "MyText" }
    executed_on { "2023-12-01" }
    concieved_of_at { "2023-12-01 18:15:17" }
    will_be_at { "2023-12-01 18:15:17" }
    persona { "" }
    forecast { "MyString" }
    person_id { 1 }
    when_at { "2023-12-01" }
    background_details { "MyText" }
    expected_result { "" }
    will_call { false }
    amount { 1.5 }
  end
end
