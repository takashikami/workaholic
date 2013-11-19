class Boss < ActiveRecord::Base
  belongs_to :user
  #belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :boss, class_name: 'User', foreign_key: :boss_id
end
