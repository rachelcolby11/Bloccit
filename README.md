##### [Bloccit-RC](https://bloccit-rc.herokuapp.com/) 

https://bloccit-rc.herokuapp.com (demo version)
https://github.com/rachelcolby11/Bloccit (source code)

### Overview

Bloccit, a Reddit replica, is the first app I made as a student at [Bloc](http://bloc.io). Bloccit is a Ruby on Rails app that lets users post, comment, and vote on links and content.

### Technologies
**Languages, Libraries, and Frameworks:** Ruby on Rails, jQuery, AJAX, Bootstrap

**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Development Tools, Gems and Methodologies:** 

* Test-Driven Development: RSpec, Capybara, FactoryGirl
* Amazon Web Services (S3) for image storage
* Devise for user authentication
* SendGrid for email notifications
* Redcarpet for Markdown formatting
* Will_paginate for pagination 
* Pundit for authorization

### Features
* Users and guests (those without accounts) can view public topics, posts, and comments.
* Users can create their own accounts in order to view private topics and posts and create their own posts and comments.
* Users can format their posts using Markdown.
* Users can favorite posts they like and vote posts up or down.
* Posts are organized by topic and sorted by their rank (determined by age and number of votes).
* Users can choose to receive email notifications when there are new comments on a post they have favorited.
* Users can upload images to use in their posts and as their avatar.
