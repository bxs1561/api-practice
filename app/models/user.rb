# frozen_string_literal: true

class User < ActiveRecord::Base
  after_update :send_password_change_email, if: :needs_password_change_email?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  include DeviseTokenAuth::Concerns::User

  private
  def needs_password_change_email?
    encrypted_password_changed? && persisted?
  end

  def send_password_change_email
    UserMailer.password_changed(id).deliver
  end

end
