class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable,:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :validatable, :trackable
  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
