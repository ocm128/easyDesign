class Attachment < ActiveRecord::Base

  belongs_to :post
  include Picturable #Concern Picturable para permitir subir imágenes

end
