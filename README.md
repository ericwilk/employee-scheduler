Employee Schedule Manager
=========================

* System dependencies:

** Git (either the cli version or a GUI. If this is your first time using git, I higly recommend trying the CLI version for a bit; it will help you learn it faster).
** Ruby-1.9.1, or use rbenv or rvm to manage multiple versions of Ruby. For example, if your system's Ruby version is different you can type:
$> rvm use 1.9.1
If you are using rbenv, it should change the version by default by looking at the .ruby-version file in the application.
. Also, you should probably install the dev libraries as well, i.e. ruby-1.9.1-dev (in linux use apt-get install ruby or yum, etc. depending on the distro you are using. On a Mac you can use something like Macports or Brew. For Windows, please forllow the instructions to download and install on the Ruby home page: http://www.ruby.org ???
** Rbenv or RVM, if either a.) The Ruby version installed by the package manager is not 1.9.1, or b.) You plan on using multiple versions of Ruby on the same machine.
** ruby-build [ADD INSTRUCTIONS] if you are using rbenv. It will give you instructions when you try to use a new version from rbenv.
** libsqlite3 and libsqlite3-dev (again, using your package manager or ports/homebrew)
** nodejs (https://github.com/jekyll/jekyll/issues/2327)

* Configuration: This is currently setup to support a development environment and use sqlite (the default). For prod, I was thinking of using ElasticBeanstalk (they claimed years ago to have Ruby support so hopefully they do by now) since it is a small application and Ruby does not seem to support transactions across DB's. I believe by default, Beanstalk uses one DB with failover (if not it can simply be represented this way). This will hopefully suffice for an internal application of low volume, to avoid any complex deployment.

* Database creation: This is automatic, but you should make sure

* Database initialization is handled automatically, but I would like to use something like MySQL or Postgres. This is a simple install / config tweak. Also, I'm considering differentiating prod vs. dev.

* rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment:

** Dev:
in a terminal or shell (cmd on Windows):
Go to the directory where you would like this to be installed and type:
$> git clone https://github.com/ericwilk/employee-scheduler.git
Go to the root application directory (it will be called employee-scheduler unless you changed the defaults). Run:
$> bundle install
the first time you use the application, or any time you add or remove dependancies from the Gemfile. If it IS the first time running this, make sure to run:
$> rake db:generate then run:
$> rake db:migrate
You will want to run the db:migrate rake task when there are schema changes (i.e. something gets added to db/migrate)
To start the server
$> rails s
To start the server in console mode (good for debugging), type:
$> rails console

**Prod: Use the UI of Elastic Beanstalk from the AWS console [more to come...]

* Rdoc generation: rake doc:app (not currently being used).

* Notes: I wanted to use the latest Ruby and Rails (it is always a good idea, since upgrading can cause some difficulties) but I went with the versions my package manager install to avoid any potential conflicts I see later on. I have had instances where my system gems conflicted with the ones in the Gemfile (even using bundler) which is not supposed to happen but I was also on a Mac and we were using older versions where Mavericks did not like to compile certain gems (i.e. therubyracer, libv8). This is small enough though, I'll probably just tweak it.
