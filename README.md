Employee Schedule Manager
=========================

## **System dependencies:**

### Install the following with your OS's package manager:

- Git (either the cli version or a GUI. If this is your first time using git, I higly recommend trying the CLI version for a bit; it will help you learn it faster).
- Ruby-1.9.1, or use rbenv or rvm to manage multiple versions of Ruby. For example, if your system's Ruby version is different you can type:
$> `rvm use 1.9.1`
If you are using rbenv, it should change the version by default by looking at the .ruby-version file in the application.
- You should probably install the dev libraries as well, i.e. ruby-1.9.1-dev
- Rbenv or RVM, if either a.) The Ruby version installed by the package manager is not 1.9.1, or b.) You plan on using multiple versions of Ruby on the same machine.
- Install ruby-build as well, if you are using rbenv. It will give you instructions when you try to use a new version from rbenv.
- Libsqlite3 and libsqlite3-dev
- Nodejs (https://github.com/jekyll/jekyll/issues/2327 - this might be fixed if I upgrade ruby)

### Configuration:

- Dev: This is currently setup to support a development environment and use sqlite (the default).
- Prod: TBD, but I was thinking of using Elastic Beanstalk (they claimed years ago to have Ruby/RoR support so hopefully they do by now) since it is a small application and Ruby does not seem to support transactions across DB's. I believe by default, Beanstalk uses one DB with failover (if not it can simply be represented this way). This will hopefully suffice for an internal application of low volume, to avoid any complex deployment.
- Database creation: This is automatic, but you should make sure
- Database initialization is handled automatically, but I would like to use something like MySQL or Postgres. This is a simple install / config tweak. Also, I'm considering differentiating prod vs. dev.
- rspec
- Services (job queues, cache servers, search engines, etc.)

### Deployment:

#### Dev:
##### In a terminal or shell (cmd on Windows):
- Go to the directory where you would like this to be installed and type:
$> git clone https://github.com/ericwilk/employee-scheduler.git
- Go to the root application directory (it will be called employee-scheduler unless you changed the defaults). Run:
$> bundle install
- The first time you use the application, or any time you add or remove dependancies from the Gemfile. If it IS the first time running this, make sure to run:
$> rake db:generate then run:
$> rake db:migrate
- You will want to run the db:migrate rake task when there are schema changes (i.e. something gets added to db/migrate)
- To start the server:
$> rails s
- To start the server in console mode (good for debugging):
$> rails console
- It is a good idea to run bundle install, rake db:migrate and git pull frequently to keep in sync with other people's changes.

#### Prod:
- This will be deployed to AWS via Elastic Beanstalk, since minimal configuration is required. Amazon RDS will be used as a "Multi-AZ Deployment" which will esentially create another DB instance in another region for failover and make sure the data is current. RDS can also take care of backups; we can decide if another in-house solution for this is necessary (so that we have the data and are not relying 100% on AWS).
##### Jenkins (we could also easily just use bash for this; it may be easier)
- Setup a Jenkins job to deploy the app.
- Make sure on that box (the one Jenkins is deployed to) the AWS EB CLI, which require Git an Pip (well, they are recommended, anyway):
$> sudo apt-get install git 
$> sudo apt-get install python-dev
$> curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
$> sudo python get-pip.py
$> sudo pip install awsebcli
- Make sure this is added to Puppet or any similar scripts Jenkins uses for deployment.
- go to the project directory and run:
$>eb init
This will go through these various options and save the metadata within the repository:

| Param                 | Default         |
| --------------------- |:---------------:|
| Region                | system-assigned |
| AWS Access Key ID     | N/A             |
| AWS Secret Access Key | N/A             |
| Application Name      | Default name    |
| Using Ruby?           | y (yes)         |
| Platform Version      | Keep default    |
| Set up SSH?           | n (no)          |

- It will change .gitignore; it is probably a good idea to check this in (I assume this is the config, above).
- To deploy the app, simply run:
$> rails-beanstalk $ eb create rails-beanstalk-env
- This last line can be added to the post-build action in Jenkins. If not all the config is saved it could easily be added here, as well.


### Other:

- Rdoc generation: rake doc:app (not currently being used).

- Notes: I wanted to use the latest Ruby and Rails (it is always a good idea, since upgrading can cause some difficulties) but I went with the versions my package manager install to avoid any potential conflicts I see later on. I have had instances where my system gems conflicted with the ones in the Gemfile (even using bundler) which is not supposed to happen but I was also on a Mac and we were using older versions where Mavericks did not like to compile certain gems (i.e. therubyracer, libv8). This is small enough though, I'll probably just tweak it.
