class Certificate < ApplicationRecord
  belongs_to :operator, class_name: 'User', foreign_key: 'operator_id', dependent: :destroy
  has_many_attached :documents
end
