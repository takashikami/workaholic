class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boss_links, class_name: 'Boss', foreign_key: :user_id, dependent: :destroy
  has_many :bosses, through: :boss_links, source: :boss

  has_many :buka_links, class_name: 'Boss', foreign_key: :boss_id, dependent: :destroy
  has_many :bukas, through: :buka_links, source: :user

  has_many :overworks
  has_many :offs
end
