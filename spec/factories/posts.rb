FactoryGirl.define do
  factory :post do
    title "hello world"
    content  "whatever"
    image { File.new Rails.root.join('spec/images/plane.jpg') }
  end
end