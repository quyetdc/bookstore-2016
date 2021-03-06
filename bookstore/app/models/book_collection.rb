# == Schema Information
#
# Table name: book_collections
#
#  id            :integer          not null, primary key
#  book_id       :integer
#  collection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_book_collections_on_book_id        (book_id)
#  index_book_collections_on_collection_id  (collection_id)
#

class BookCollection < ActiveRecord::Base
  belongs_to :book
  belongs_to :collection

  validates :book_id, uniqueness: {
                        scope: :collection_id,
                        message: 'We should not add a book to a collection two times'
                      }
end
