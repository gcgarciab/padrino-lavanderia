class Garment
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :name, :type => String
  field :quantity, :type => Integer
  field :description, :type => String

  belongs_to :order
  has_many :services

end
