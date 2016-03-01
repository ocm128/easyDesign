class Post < ActiveRecord::Base

  include Picturable  # Concern Picturable para permitir subir imágenes
  #include Trackable # Concern Trackable para permitir trackear las acciones de los usuarios

  # Registrará cada vez que se cree, actualice o elimine un post
  #include PublicActivity::Model
 # tracked owner: Proc.new{ |controller, model| controller.current_usuario }

  belongs_to :usuario, dependent: :destroy
  has_many :attachments
  validates :titulo, presence: true, uniqueness: true
  before_save :valores_por_default

  # #include PublicActivity::Model
  # #tracked owner: Proc.new { |controller,model| controller.current_usuario }
  # after_create {|post| post.message 'create'}

  # def message action
  #   msg = {
  #     resource: 'posts',
  #     action: action,
  #     id: self.id,
  #     obj: self,
  #     username: self.usuario.username.capitalize,
  #     user_id: self.usuario.id

  #   }
  #   $redis.publish 'rt-change', msg.to_json
  # end

  def valores_por_default
    self.costo ||= 0 # asigna 0 cuando no tenga un valor
  end

end
