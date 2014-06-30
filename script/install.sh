#!/bin/bash
# Installation file

echo ""
echo "--------------------------------------------------------------------"
echo "=============== APPLICATION INSTALLATION ==========================="
echo "--------------------------------------------------------------------"
echo ""

r=`bundle check`

if [[ $r =~ .*ERROR.* ]]; then
  echo $r
  
  exit
fi

if [[ $r =~ .*missing.* ]]; then
  echo "Installing gems"
  
  bundle install --local
  
  echo "Done installing gems"
fi

echo ""

echo "Type target mode (development|production|test), followed by [ENTER]:"

read mode

echo "Enter SITENAME, followed by [ENTER]:"

read site

ruby -ryaml -e "data = {'production' => {'site' => 'KCH', 'site' => '$site'}, 'development' => {'site' => 'KCH', 'site' => '$site'}, 'test' => {'site' => 'KCH', 'site' => '$site'}}; File.open('config/settings.yml','w').write(data.to_yaml); data = {};"

echo "Enter Database USERNAME, followed by [ENTER]:"

read username

echo "Enter Database PASSWORD, followed by [ENTER]:"

read password

echo "Enter DATABASE NAME, followed by [ENTER]:"

read database

echo "Enter Database HOST IP, followed by [ENTER]:"

read host

# ruby -ryaml -e "data = {'production' => {'adapter' => 'mysql', 'username' => '$username', 'password' => '$password', 'database' => '$database' + '_production', 'host' => '$host', 'pool' => 500}, 'development' => {'adapter' => 'mysql', 'username' => '$username', 'password' => '$password', 'database' => '$database' + '_development', 'host' => '$host', 'pool' => 500}, 'test' => {'adapter' => 'mysql', 'username' => '$username', 'password' => '$password', 'database' => '$database' + '_test', 'host' => '$host', 'pool' => 500}}; File.open('config/database.yml','w').write(data.to_yaml); data = {};"

ruby -ryaml -e "data = {'$mode' => {'adapter' => 'mysql', 'username' => '$username', 'password' => '$password', 'database' => '$database', 'host' => '$host', 'pool' => 500}}; File.open('config/database.yml','w').write(data.to_yaml); data = {};"

export RAILS_ENV=$mode

rake db:drop db:create db:migrate db:seed

echo "DONE!"
