class RealpersonController < ApplicationController
  layout false
  def index
    @options = {head_tags: render_to_string(:template => 'application/head_tags', :layout => false)}
  end
  
  # POST /form
  # POST /form.json
  
  def create
    #defaultReal = params[:defaultReal]
    #realPerson = params[:realPerson]
    #realPersonHash = params[:realPersonHash]
    realPerson = params[:defaultReal]
    realPersonHash = params[:defaultRealHash]
		
    if !realPerson.nil? && !realPersonHash.nil? && Integer(rpHash(realPerson)) == Integer(realPersonHash)
    # Accepted
      render :text => "<p class=\"accepted\">You have entered the \"real person\" value correctly and the form has been processed.</p>", :layout => "realperson" 
    else 
    # Rejected
      render :text => sprintf('<p class="rejected">You have NOT entered the "real person" value (%s) correctly and the form has been rejected.(%s) (%s)</p>', realPerson, rpHash(realPerson),realPersonHash), :layout => "realperson" 

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
