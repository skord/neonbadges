class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :registerable, :omniauthable, :trackable #, :database_authenticatable
         # :recoverable, :rememberable, :validatable
  has_many :owned_badges, class_name: "Badge", foreign_key: :owner_id

  def self.find_for_twitter_auth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
     user = User.create(
                             provider:auth.provider,
                             uid:auth.uid,
                             nickname:auth.info.nickname,
                             name: auth.info.name,
                         )
    end
    user
  end
end
