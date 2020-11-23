class PostsController < ApplicationController
	def index # index アクションを定義
		@posts = Post.all.order(id: "DESC")
	end
	def create
		Post.create(content: params[:content])
		redirect_to action: :index
	end
	def checked
		post = Post.find(parems[:id])
		if post.checked
			post.update(checked: false)
		else
			post.update(checked: true)
		end

		item = Post.find(params[:id])
		render json: { post: item}
	end
end
