Ubuntu/Debian OS 10.04 or later(operating system)
Firefox 11.0 or later(web browser)
Ruby 1.8.7(programming language)
Rubygems 1.3.7(ruby gem manager)
Rails 2.3.5(ruby web application framework)
Passenger 3.0 or later(web application server)
MySQL version 5 or later(database server)

Prerequisites

Before you begin the installation make sure you have the following installed on Ubuntu/Debian OS 10.04 or above:
Firefox  11.0 or above
Ruby 1.8.7
Rubygems 1.3.7
MySQL version 5 or above


1.  Configurations
    **  Copy .example files into there respective .yml
    **  Edit database.yml to adapt the creditials of mysql
    **  Edit setting.yml to the current name of the Facility

2.  Database creation
    **  Run the following command
          bundle exec rake db:drop db:create
	  mysql -u root -p DB_NAME < db/default.sql 

3.  Running the application
    **  ./script/server -p PORT_NUMBER

4.  Editing application name and url 
    **  Click the application name
    **  login as usename: admin , password:test
    **  Edit names and url for the applications .ie name => ANC , url => http://192.168.12.8:4004
