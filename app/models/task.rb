class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :company, type: String
  field :url, type: String

  field :category_id, type: Integer
  belongs_to :category
end
