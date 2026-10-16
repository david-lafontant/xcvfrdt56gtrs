FactoryBot.define do
  factory :certificate do
    first_name { "MyString" }
    last_name { "MyString" }
    company { "MyString" }
    certificate_id { "MyString" }
    documents { nil }
    operator { nil }
    description { "MyText" }
  end
end
