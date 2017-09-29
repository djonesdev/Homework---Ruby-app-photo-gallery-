class PostsController < Sinatra::Base

	configure :development do 
		register Sinatra::Reloader
	end

#ERB - embedded Ruby 

set :root, File.join(File.dirname(__FILE__), "..")

set :views, Proc.new { File.join(root, 'views') }

	  $posts = [{
      title: "Post 1",
      body: 'https://i.ytimg.com/vi/E9U9xS4thxU/hqdefault.jpg'
	  },
	  {
	      title: "Post 2",
	      body: 'https://i.pinimg.com/736x/fc/ea/9a/fcea9a5369ebbdca95dca1c0aa1e1a51--funny-cat-humor-cats-humor.jpg'
	  },
	  {
	      title: "Post 3",
	      body: 'https://i.ytimg.com/vi/9nZMHBDw8os/hqdefault.jpg'
	  }]


	get "/posts" do 
		@page_header = "All Posts"
		@posts = $posts 
		erb :"posts/index"
	end

	get "/posts/new" do 
		erb :"posts/new"
	end

	get "/posts/:id" do 
		id = params[:id].to_i  
		@page_header = "Single post"
		@post = $posts[id]
		erb :"posts/shows"
	end

	post "/posts" do 
		new_post = {
			title: params[:title],
			body: params[:body]
		}
		$posts << new_post
		redirect '/posts'
	end

	get "/posts/:id/edit" do 
		@id = params[:id].to_i
		@post = $posts[@id]

		erb :"posts/edit"
	end

	put "/posts/:id" do 
		id = params[:id].to_i
		$posts[id][:title] = params[:title]
		$posts[id][:body] = params[:body]
		$posts[id][:comment] = params[:comment]

		redirect "/posts/#{id}"
	end

	delete "/posts/:id" do 
		id = params[:id].to_i
		$posts.delete_at(id)
		redirect "/posts"
	end

end