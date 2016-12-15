FactoryGirl.define do
  factory :message do
    chatroom nil
    user nil
    visitor nil
    body "MyText"
  end
end
