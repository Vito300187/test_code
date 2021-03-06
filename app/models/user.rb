require 'devise' # Подключение гема devise, для регистрации пользователей
class User < ApplicationRecord
  has_many :orders # связь - Юзер имеет много заказов
  has_one :cart # связь - Юзер имеет одну корзину

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  after_create :update_admin # Коллбек проверки и проставления администраторских прав первому
  # созданному юзеру, вызывается после сохранения в базу.
  #validates :name, :email, presence: true #Имя должно быть обязательно заполнено

  private
  #Метод меняет значение первого зарегестрированного пользователя на true for admin
  def update_admin
    self.update_attributes(admin: true) if User.count == 1
  end
end