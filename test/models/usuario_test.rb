require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Debe crear un usuario" do
    u = Usuario.new(username: "johndoe", email: "johndoe@mail.com", password: "pass")
    assert u.save, "Usuario creado"
  end

  test "Debe crear usuario sin email" do
    u = Usuario.new(username: "Johndoe", password:"pass")
    assert u.save, "No se guardo el usuario"
 end

end
