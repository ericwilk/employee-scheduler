require 'authlogic'

class User < ActiveRecord::Base
  acts_as_authentic do |config|
	config.crypto_provider = Authlogic::CryptoProviders::MD5
	config.logged_in_timeout = 30.minutes

	# Since the requirements specified users but no password, we can
	# initially store them as a blank string
	# a check could be added to require them to change their password,
	# or to email them a new temp on and then change it (preferable)
	config.ignore_blank_passwords = false
  config.check_passwords_against_database = false
  config.validate_email_field = false
  config.validate_login_field = false
  
  end
  has_many :scheduled_date

  def support_hero?
    ScheduledDate.find(:user => this, :event_type_name => "SUPPORT_HERO", :day => Date.today)
  end
end
