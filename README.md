# [Bloccit](https://bloccit-rc.herokuapp.com/) 

Bloccit, a Reddit replica, is the first app I made as a student at [Bloc](http://bloc.io). Bloccit is a Ruby on Rails app that lets users post, comment, and vote on links and content.

* The app is deployed on Heroku: https://bloccit-rc.herokuapp.com
* The source code is here on GitHub: https://github.com/rachelcolby11/Bloccit

## Setup and Configuration
**Languages, Libraries, and Frameworks:** Ruby on Rails, jQuery, AJAX, Bootstrap

**Ruby version 2.2.0**

**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Development Tools, Gems and Methodologies include:** 
* Test-Driven Development: RSpec, Capybara, FactoryGirl
* Amazon Web Services (S3) for image storage
* Devise for user authentication
* SendGrid for email notifications
* Redcarpet for Markdown formatting
* Will_paginate for pagination 
* Pundit for authorization

####**Setup:**
* Environment variables were set using [Figaro] (https://github.com/laserlemon/figaro) and are stored in config/application.yml (ignored by git).
* The config/application.example.yml file illustrates how environment variables for SendGrid and Amazon Web Services should be stored.

####**To run Bloccit locally:**
* Clone the repository
* Run `bundle install`
* Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
* Start the server using `rails server`
* Run the app on `localhost:3000` 

##Features
* Users and guests (those without accounts) can view public topics, posts, and comments.
* Users can create their own accounts in order to view private topics and posts and create their own posts and comments.
* Users can format their posts using Markdown.
* Users can favorite posts they like and vote posts up or down.
* Posts are organized by topic and sorted by their rank (determined by age and number of votes).
* Users can choose to receive email notifications when there are new comments on a post they have favorited.
* Users can upload images to use in their posts and as their avatar.
