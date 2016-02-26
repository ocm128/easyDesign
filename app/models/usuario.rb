class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :twitter]

  validates :username, presence: true, uniqueness: true,
                  length: {in: 5..20, too_short: "tiene que tener al menos 5 caracteres",
                  too_long: "Puede tener máximo 20 caracteres"},
                  format: {with: /([A-Za-z0-9\-\_]+)/, message: "sólo puede contener letras,
                   números y guiones"}

  # validate permite validaciones personalizadas
  #validate :validacion_personalizada, on: :create

  def self.find_or_create_by_omniauth(auth)
    usuario = Usuario.where(provider: auth[:provider], uid: auth[:uid]).first

    # Si no existe el usuario en la bd lo crea
    unless usuario
      usuario = Usuario.create(
        nombre: auth[:nombre],
        apellido: auth[:apellido],
        username: auth[:username],
        email: auth[:email],
        provider: auth[:provider],
        uid: auth[:uid],
        password: Devise.friendly_token[0,20]
        )
    end
  end

  private

    # def validacion_personalizada
    #   if true

    #   else
    #     errors.add(:username, "Tu username no es valido")

    #   end
    # end

end
