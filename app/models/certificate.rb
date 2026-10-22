class Certificate < ApplicationRecord
  belongs_to :operator, class_name: 'User', foreign_key: 'operator_id'
  has_many_attached :documents

  before_validation :create_certificate_id, on: :create
  after_initialize :set_certificate_canceled_status, if: :new_record?

  def user_name
    return self.first_name + " " + self.last_name
  end

  private
  
  def create_certificate_id
    self.certificate_id = "CNT//BD" + SecureRandom.uuid
  end

  def set_certificate_canceled_status
    self.canceled = false
  end

end
