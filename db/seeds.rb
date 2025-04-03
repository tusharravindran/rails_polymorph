# Clear existing data
Comment.destroy_all
Post.destroy_all
Article.destroy_all
User.destroy_all

# Create Users with Devise (make sure User model has :name field)
user1 = User.create!(
  email: "john@example.com",
  password: "password123",
  password_confirmation: "password123"
)

user2 = User.create!(
  email: "jane@example.com",
  password: "password123",
  password_confirmation: "password123"
)

puts "✅ Created Users: #{User.count}"

# Create Posts
post1 = Post.create!(title: "First Post", content: "This is the body of the first post", user: user1)
post2 = Post.create!(title: "Second Post", content: "This is the body of the second post", user: user2)

puts "✅ Created Posts: #{Post.count}"

# Create Articles
article1 = Article.create!(title: "First Article", content: "This is the first article content", user: user1)
article2 = Article.create!(title: "Second Article", content: "This is the second article content", user: user2)
article3 = Article.create!(title: "Third Article", content: "This is the Third article content", user: user2)
article4 = Article.create!(title: "Fourth Article", content: "This is the Fourth article content", user: user2)
article5 = Article.create!(title: "Fifth Article", content: "This is the Fifth article content", user: user2)
article6 = Article.create!(title: "Sixth Article", content: "This is the Sixth article content", user: user2)


puts "✅ Created Articles: #{Article.count}"

# Create Comments (Polymorphic Association)
Comment.create!(content: "Great post!", user: user2, commentable: post1)
Comment.create!(content: "Nice article!", user: user1, commentable: article1)
Comment.create!(content: "I found this useful.", user: user1, commentable: post2)
Comment.create!(content: "Good read!", user: user2, commentable: article2)
Comment.create!(content: "Good read1!", user: user2, commentable: article3)
Comment.create!(content: "Good read2!", user: user2, commentable: article4)
Comment.create!(content: "Good read3!", user: user2, commentable: article5)


puts "✅ Created Comments: #{Comment.count}"
