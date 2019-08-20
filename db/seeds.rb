# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = Post.create([{title: 'Create a Blog With Ruby', content: 'https://medium.com/@bruno_boehm/full-blog-app-tutorial-on-rails-zero-to-deploy-4c19e8174791'}, {title: 'Title', content: 'This is a content.'}, {title: 'Liber Capital', content: 'This is a content for Liber Capital.'}])
Comment.create(post_id: posts.first.id, content: 'This post is amazing!')
