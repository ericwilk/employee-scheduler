class UserSession < AuthLogic::Session::Base
  def to_key
	[session_key]
  end
end
