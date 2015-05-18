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

require 'rails_helper'

RSpec.describe Goal, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
