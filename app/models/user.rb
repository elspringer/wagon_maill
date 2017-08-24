class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :subscribe_to_newsletter

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
