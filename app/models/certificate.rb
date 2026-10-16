class Certificate < ApplicationRecord
  belongs_to :operator, class_name: 'User', foreign_key: 'author_id', dependent: :destroy
  has_many_attached :documents
end
