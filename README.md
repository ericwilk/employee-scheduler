Employee Schedule Manager
=========================

# **System dependencies:**

## Install the following with your OS's package manager:

- Git (either the cli version or a GUI. If this is your first time using git, I higly recommend trying the CLI version for a bit; it will help you learn it faster).
- Ruby-1.9.1, or use rbenv or rvm to manage multiple versions of Ruby. For example, if your system's Ruby version is different you can type:
$> `rvm use 1.9.1`
If you are using rbenv, it should change the version by default by looking at the .ruby-version file in the application.
- You should probably install the dev libraries as well, i.e. ruby-1.9.1-dev
- Rbenv or RVM, if either a.) The Ruby version installed by the package manager is not 1.9.1, or b.) You plan on using multiple versions of Ruby on the same machine.
- Install ruby-build as well, if you are using rbenv. It will give you instructions when you try to use a new version from rbenv.
- MySQL (I am running Ver 5.6.19-0ubuntu0.14.04.1). Keep note of the root password you create.
- libmysqlclient-dev
- I would highly recommend keeping the root password protected. You can create a new user by:  
$> mysql -u root -p
... and type the root password you remembered. If you want to stay consistent with the way I set this up on my machine, I gave the query:
```
mysql> CREATE USER 'newrelic'@'localhost' IDENTIFIED BY 'nremployeetest';
Query OK, 0 rows affected (0.00 sec)

mysql> quit
Bye
```
- Create a new DB with this user as the owner:
```
$> mysql -u root -p
mysql> CREATE DATABASE employee_scheduler;
Query OK, 1 row affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON employee_scheduler.* TO 'newrelic'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
```
- Test this out really quickly:
```
$> mysql -u newrelic --password=nremployeetest
Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 43
Server version: 5.6.19-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| employee_scheduler |
+--------------------+
```

Rails should do the rest.

- Nodejs (https://github.com/jekyll/jekyll/issues/2327 - this might be fixed if I upgrade ruby)

## Configuration:

- Dev: This is currently setup to support a development environment and use sqlite (the default).
- Prod: TBD, but I was thinking of using Elastic Beanstalk (they claimed years ago to have Ruby/RoR support so hopefully they do by now) since it is a small application and Ruby does not seem to support transactions across DB's. I believe by default, Beanstalk uses one DB with failover (if not it can simply be represented this way). This will hopefully suffice for an internal application of low volume, to avoid any complex deployment.
- Database creation: This is automatic, but you should make sure
- Database initialization is handled automatically, but I would like to use something like MySQL or Postgres. This is a simple install / config tweak. Also, I'm considering differentiating prod vs. dev.
- rspec
- Services (job queues, cache servers, search engines, etc.)

## Deployment:

### Dev:
in a terminal or shell (cmd on Windows):
Go to the directory where you would like this to be installed and type:
$> git clone https://github.com/ericwilk/employee-scheduler.git
Go to the root application directory (it will be called employee-scheduler unless you changed the defaults). Run:
$> bundle install
the first time you use the application, or any time you add or remove dependancies from the Gemfile. If it IS the first time running this, make sure to run:
$> rake db:create then run:
$> rake db:migrate
You will want to run the db:migrate rake task when there are schema changes (i.e. something gets added to db/migrate)
To start the server
$> rails s
To start the server in console mode (good for debugging), type:
$> rails console

### Prod:
Use the UI of Elastic Beanstalk from the AWS console [more to come...]

## Other:

- Rdoc generation: rake doc:app (not currently being used).

- Notes: I wanted to use the latest Ruby and Rails (it is always a good idea, since upgrading can cause some difficulties) but I went with the versions my package manager install to avoid any potential conflicts I see later on. I have had instances where my system gems conflicted with the ones in the Gemfile (even using bundler) which is not supposed to happen but I was also on a Mac and we were using older versions where Mavericks did not like to compile certain gems (i.e. therubyracer, libv8). This is small enough though, I'll probably just tweak it.
