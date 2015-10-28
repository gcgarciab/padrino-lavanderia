class User
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :name, :type => String
  field :phone, :type => String
  field :email, :type => String
  field :password, :type => String
  field :uid, :type => String
  field :access_token, :type => String

  has_many :places
  has_many :orders

  def self.login(auth)
    user = User.where(uid: auth["uid"]).first
    if user
      user.uid      = auth["uid"]
      user.name    = auth["info"]["name"]
      user.access_token = auth["credentials"]["token"]
      if user.save
        user
      else
        false
      end
    else
      false
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid      = auth["uid"]
      user.name    = auth["info"]["name"]
      user.email    = auth["user_info"]["email"] if auth["user_info"] # we get this only from FB
      user.access_token = auth["credentials"]["token"]
    end
  end

end
