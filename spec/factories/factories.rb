FactoryGirl.define do
  factory :course do
    sequence(:name)  { |n| "Course #{n}" }
  end

  factory :note do
    content "Lorem ipsum"
    course
  end
end