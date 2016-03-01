require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Debe poder crear un post"  do
    post = Post.create(titulo: "Mi titulo", contenido: "Mi contenido")
    assert post.save
  end

  test "Debe poder actualizar un post" do
    post = posts(:primer_articulo)
    assert post.update(titulo: "Nuevo titulo", contenido: "Nuevo contenido")
  end

  test "Debe encontrar un post por su id" do
    post_id = posts(:primer_articulo).id
    #post = Post.find(post_id)
    #assert_equal post, posts(:primer_articulo), "No encontró el registro"
    assert_nothing_raised { Post.find(post_id) }
  end

  test "Debe borrar un post por su id"  do
    post = posts(:primer_articulo)
    post.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Post.find(post.id)}
  end

  test "No debe crear un post sin titulo" do
    post = Post.new
    assert post.invalid?  # Devuelve true sin es un post no válido
  end

  test "Cada titulo debe ser único" do
    post = Post.new
    post.titulo = posts(:primer_articulo).titulo
    assert post.invalid? "Dos posts no pueden tener el mismo título"
  end
end
