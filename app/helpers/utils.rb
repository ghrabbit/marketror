require "active_support"

module Utils

  MINPASSWORDLEN = 10;

  def self.generate_key(maxlen = MINPASSWORDLEN)
    SecureRandom.hex(maxlen)
  end

end
