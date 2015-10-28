class Order
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :score, :type => Integer
  field :comment, :type => String

  belongs_to :user
  has_one :bill
  has_one :state
  has_many :garments
  belongs_to :delivery

end
