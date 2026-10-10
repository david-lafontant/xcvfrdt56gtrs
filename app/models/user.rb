class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable,:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable, :lockable, :timeoutable,
         :recoverable, :rememberable, :validatable, :trackable

  enum :role, %i[user admin sysadmin].freeze, default: :user, validate: true
  enum :institution, %i[conatel agd].freeze, default: :conatel, validate: true
  after_initialize :set_default_role, if: :new_record?
  after_initialize :set_banned, if: :new_record?
  after_initialize :set_default_institution, if: :new_record?
  before_validation :clean_field, on: :create

  private

  def set_default_role
    self.role ||= :user
  end

  def set_banned
    self.banned ||= false
  end

  def set_default_institution
    self.institution ||= :conatel
  end

  def clean_field
    [:last_name, :first_name].each do |elem|
      if self[elem].present?
        self[elem] = self[elem].strip.downcase
      end
    end
  end
end
