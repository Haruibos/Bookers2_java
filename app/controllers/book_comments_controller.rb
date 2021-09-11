class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.user_id = current_user.id
		@book_comment.save
		# unless @book_comment.save then
			# render 'error'

		# end
	end
	# 「unless」文は条件式が偽の場合の処理を記述するのに使われます。

	def destroy
		@book = Book.find(params[:book_id])
  	    book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy
		# redirect_to request.referer
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end