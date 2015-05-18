# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  body        :string           default(""), not null
#  visible     :boolean          default(TRUE), not null
#  user_id     :integer          not null
#  completed   :boolean          default(FALSE), not null
#  target_date :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    title "Lose 10lbs"
    body  "Lose 10lbs by Memorial Day"
    visible false
    completed false
    target_date '05-25-2015'
  end

end
