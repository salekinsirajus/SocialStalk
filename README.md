# Teal  - A Social App


## General Overview
This web application functions as a social connector and its primary purpose is to facilitate the connection of users who have some certain needs with other users who can fulfil those needs. Hence, users can search for, connect with, and make their requests to other users who may not be within close geographic proximity. 

## Technical Overview
* Ruby 2.3.1
* PostgreSQL 9.3.15
* jQuery
* Bootstrap CSS

## Getting Started
Please have ruby, ruby on rails and postgresql installed before continuing with setting up this project. Depending on which OS you are using there may be different issues in setting up this project. However, the project should run successfully on [c9.io](https://c9.io).

To setup this project, please follow the instructions below:
* Restart the psql server: `sudo service postgresql restart`
* Setup the database by running `rake db:create` and `rake db:schema:dump`.
* Follow [this guide](https://gist.github.com/amolkhanorkar/8706915) to fix the problem below:
> `PG::Error: ERROR: new encoding (UTF8) is incompatible`
* Run `rake db:migrate`.
* Run `rails server` and navigate to the port specified. 

## Development Gems
Below is a list of the gems and their use(s) in building the social application:
* **Rails 4.2.5** - used to scaffold the application structure.
* **Devise** - user authentication, and security and session management.
* **CarrierWave** - upload files from the Ruby application.
* **acts_as_commentable** - implement the commenting feature.        
* **acts_as_follower** - create relationships between users as follower-following.                       
* **public_activity** - to implement news feed feature.
* **will_paginate** - to paginate the list of records.
* **has_friendship** - create relationships between users as friends.
* **jbuilder** - for writing JSON files
* **coffee_rails** - writing and executing coffeescript code (primarily notification)
