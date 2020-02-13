# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app / I used the Sinatra Gem along with Corneal to create my web application.
- [x] Use ActiveRecord for storing information in a database / I utilized ActiveRecord to save data to my database with migrations.
- [x] Include more than one model class (e.g. User, Post, Category) / I have a User and a Goal model class.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) / My User model has many Goals.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) / My Goal model belongs to a User.
- [x] Include user accounts with unique login attribute (username or email) / Username and Email are validated upon sign up in my App.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying / All CRUD functions are available for users on Goal objects.
- [x] Ensure that users can't modify content created by other users / Users can only Update and Delete their own Goals.
- [x] Include user input validations / All Log In/Sign up attributes have validations, same for Goals.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code / My README includes these.

Confirm
- [x] You have a large number of small Git commits / At the moment of typing this I have 97 commits, there will be more than this.
- [x] Your commit messages are meaningful / I tried to explain exactly what I was doing in each commit message.
- [x] You made the changes in a commit that relate to the commit message / My commit message describes what I changed in these files.
- [x] You don't include changes in a commit that aren't related to the commit message / My commit messages encapsulated everything I changed.