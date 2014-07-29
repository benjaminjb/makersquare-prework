class Pet

	def noise(bark)
		@sound = bark
	end


	def speak
    	puts "#{@sound}"
    end

    def command(command)
    	case command
    	when "sit"
    		puts "Dog sits"
    	when "stay"
    		puts "Dog stays"
    	end
    end

    def fetch(item)
    	item.to_s
    	puts "Pet fetched #{item}"
    end
end