helpers do

  def current_user
        # Por hacer: devolver la instancia del usuario logueado si hay uno.
    if session[:user_id] != nil
        user = User.find(session[:user_id])
    end

  end

  #Evaluate if the user is valid or not.
  def validate (user,  user_input)
	if user
		if user.authenticate(user_input["password"]) == true
			out = 0 
		else
			out = 2
		end
	else
		out = 1
	end
   end
end
