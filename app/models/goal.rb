# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string           not null
#  privacy    :string           not null
#  status     :string           default("Incomplete")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  STATUSES = ["Incomplete", "Complete"]
  PRIVACIES = ["Private", "Public"]

  validates :user, :title, :privacy, presence: true
  validates :privacy, inclusion: { in: PRIVACIES }
  validates :status, inclusion: { in: STATUSES }
  belongs_to :user

end
