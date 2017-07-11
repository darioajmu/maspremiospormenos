FactoryGirl.define do
  factory :usuario do
    id { 1 }
    email { [Faker::Internet.email, Faker::Internet.free_email].sample }
    password { Faker::Internet.password(8) }
    provincia_id { 1 }
    tipo_documento_id { 1 }
  end
end
