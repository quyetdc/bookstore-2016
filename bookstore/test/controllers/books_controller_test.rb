# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  name           :string
#  about          :text
#  publisher      :string
#  year           :integer
#  isbn           :integer
#  price          :float
#  image          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  is_new         :integer          default(0)
#  is_best_seller :integer          default(0)
#  original_price :integer
#

require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { about: @book.about, image: @book.image, isbn: @book.isbn, name: @book.name, price: @book.price, publisher: @book.publisher, year: @book.year }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { about: @book.about, image: @book.image, isbn: @book.isbn, name: @book.name, price: @book.price, publisher: @book.publisher, year: @book.year }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
