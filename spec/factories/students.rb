FactoryGirl.define do
  factory :student do
    full_name { "Scott Summers"}
    token     SecureRandom.urlsafe_base64.to_s
  end
end