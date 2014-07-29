module send

end

class SnailMail
	include send
end

class Email < SnailMail

end

class referredEmail < Email

end

class SMS
	include send

	
end
