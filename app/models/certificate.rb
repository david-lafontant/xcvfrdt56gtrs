class Certificate < ApplicationRecord
  belongs_to :operator, class_name: 'User', foreign_key: 'operator_id', dependent: :destroy
  has_many_attached :documents

  before_validation :create_certificate_id, on: :create

  def user_name
    return self.first_name + " " + self.last_name
  end

  private
  
  def create_certificate_id
    self.certificate_id = "CNT//BD" + SecureRandom.uuid
  end

  # def user_name
  #   return self.first_name + " " + self.last_name
  # end

end
