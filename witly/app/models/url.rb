# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  input      :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Url < ActiveRecord::Base
end
