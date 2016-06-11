class RealPersonValidator < ActiveModel::Validator
  def validate(record)
    if !record.verifyCode.nil? && !record.verifyCodeHash.nil? && Integer(rpHash(record.verifyCode)) == Integer(record.verifyCodeHash)
      return true
    else  
      record.errors[:verifyCode] << sprintf(I18n.t("app.badCaptcha"),record.verifyCode)
    end
  end
  
private 

	def rpHash (defaultReal)
		hash = 5381
		if !defaultReal.nil?
			defaultReal.upcase!
			defaultReal.length.times{ |i| hash = ((shift_32 hash, 5) + hash) + defaultReal[i].ord }
		end
		return hash
	end
	
	def shift_32 x, shift_amount
	  shift_amount &= 0x1F
	  x <<= shift_amount
	  x &= 0xFFFFFFFF 
	
	  if (x & (1<<31)).zero?
	   x
	  else
	   x - 2**32
	  end
	end  
end
