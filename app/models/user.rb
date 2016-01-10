class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :univ
  has_many :posts
  has_many :likes
  has_many :sent_messsage, :class_name => 'Message', :foreign_key => 'from_id'
  has_many :recieved_messsage, :class_name => 'Message', :foreign_key => 'to_id'
end
