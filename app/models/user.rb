class User < ActiveRecord::Base
  acts_as_authentic do |config|
	config.crypto_provider = Authlogic::CryptoProviders:MD5
	config.logged_in_timeout = 30.minutes

	# Since the requirements specified users but no password, we can
	# initially store them as a blank string
	# a check could be added to require them to change their password,
	# or to email them a new temp on and then change it (preferable)
	config.ignore_blank_passwords = false
  end
end
