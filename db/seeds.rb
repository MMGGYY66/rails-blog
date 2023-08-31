first_user = User.create(name: 'Rhaenyra', photo: 'https://th.bing.com/th/id/OIP._VGFb07N31_kEVwva8aQQAHaKh?pid=ImgDet&rs=1', bio: 'The rightful Queen')

second_user = User.create(name: 'Aegon II', photo: 'https://th.bing.com/th/id/R.7a87cdbb6a234e0fab947133222eb0f2?rik=9Csadip5dDPJyw&pid=ImgRaw&r=0', bio: 'The usurper', email: 'ahmad@gmail.com')

third_user = User.create(name: 'Viserys I', photo: 'https://th.bing.com/th/id/R.a04aa9bd808f62f215435fd962df64d2?rik=8y15zSDfijCEcw&pid=ImgRaw&r=0', bio: 'The Peaceful King', email: 'ahmad@gmail.com')

# first_post = Post.create(author: first_user, title: 'My story', text: 'This is my first post')
# second_post = Post.create(author: first_user, title: 'The Iron Throne is mine.', text: 'This is my second post')
# third_post = Post.create(author: first_user, title: 'The Dance of Dragons', text: 'This is my third post')
# fourth_post = Post.create(author: first_user, title: 'The End', text: 'This is my fourth post')

# Comment.create(post: first_post, author: second_user, text: 'Hi sister!' )
# Comment.create(post: first_post, author: third_user, text: 'Hey there!' )
# Comment.create(post: first_post, author: third_user, text: 'Daughter hyd!' )
# Comment.create(post: first_post, author: third_user, text: 'I hope youre ok!' )
# Comment.create(post: first_post, author: second_user, text: 'NO!' )
# Comment.create(post: first_post, author: third_user, text: 'Heyyyyy' )

# Like.create(author: first_user, post: first_post)
# Like.create(author: second_user, post: first_post)
# Like.create(author: third_user, post: first_post)
