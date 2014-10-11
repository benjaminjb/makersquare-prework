
class Person
	attr_reader :name
	attr_accessor :cash

	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end



class Bank
	attr_accessor :accounts
	attr_accessor :name

	def initialize(name)
		@name = name
		@total_cash = 0
		@accounts = {}
		puts "#{@name} bank was just created."
	end

	def total_cash_in_bank		
		print "#{@name} has $#{@accounts.values.inject { |a, b| a[:cash] + b[:cash] }} in the bank."
	end

	def total_credit_owed_to_bank		
		print "#{@name} has $#{@accounts.values.inject { |a, b| a[:cc_total] + b[:cc_total] }} owed to the bank."
	end


	def open_account(user)
		@accounts[user] = {cash: 0, cc_account: false, cc_total: 0} 
		puts "#{user.name}, thanks for opening an account at #{@name}!"
	end

	def check_account(user)
		if @accounts.has_key?(user)

	def deposit(user,amount)
		if user.cash < amount
			puts "#{user.name} does not have enough cash to deposit $#{amount}."
			# puts "Did you check your other pocket?"
		elsif @accounts.has_key?(user)
			@accounts[user][:cash] += amount
			user.cash -= amount
			puts "#{user.name} deposited $#{amount} to #{@name}. #{user.name} has $#{user.cash}. #{user.name}'s account has $#{@accounts[user][:cash]}"
		else
			puts "I'm afraid #{user.name} doesn't have an account at #{@name} bank."
			# puts "But if you want to get rid of that money, I'll take it."
		end
	end

	def withdraw(user,amount)
		if @accounts.has_key?(user)
			if @accounts[user][:cash] > amount
				@accounts[user][:cash] -= amount
				user.cash += amount
				puts "#{user.name} withdrew $#{amount} from #{@name}. #{user.name} has $#{user.cash}. #{user.name}'s account has $#{@accounts[user][:cash]}"
			else
				puts "#{user.name} does not have enough money in the account at #{@name} bank to withdraw $#{amount}."
				# puts "Have you considered our low-interest credit cards?"
				# puts "(Mwahahahaha)"
			end
		else
			puts "I'm afraid #{user.name} doesn't have an account at #{@name} bank."
			# puts "#{user.name} either has an account at another bank or has all their money in secret Swiss accounts."
		end
	end

	def transfer(user, other_bank, amount)
		if @accounts.has_key?(user)
			if other_bank.accounts.has_key?(user)
				if @accounts[user][:cash] > amount
					@accounts[user][:cash] -= amount
					other_bank.accounts[user][:cash] +=amount
					puts "#{user.name} transfered $#{amount} from the #{@name} account to the #{other_bank.name} account."
					puts "The #{@name} account has $#{@accounts[user][:cash]} and the #{other_bank.name} account has $#{other_bank.accounts[user][:cash]}."
				else
					puts "I'm afraid #{user.name} doesn't have $#{amount} in the account at #{@name} bank to transfer."
					# puts "This is awkward."
				end
			else
				puts "I'm afraid #{user.name} doesn't have an account at #{other_bank.name} bank."
			end
		else
			puts "I'm afraid #{user.name} doesn't have an account at #{@name} bank."
		end
	end

	def open_credit_account(user)
		if @accounts.has_key?(user)
			@accounts[user][:cc_account] = true
			puts "#{user.name} has successfully opened a credit card at #{@name} bank."
		else
			puts "#{user.name} has no account at #{@name} bank. Please open an account before applying for a credit card."
		end
	end

	def check_credit(user)
		if @accounts.has_key?(user)
			if @accounts[user][:cc_account] == true
				puts "#{user.name} owes $#{@accounts[user][:cc_total]} on their credit card."
			else 
				puts "#{user.name} does not have a credit card at #{@name} bank."
			end
		else
			puts "#{user.name} has no account at #{@name} bank. Please open an account, then a credit card account, and then check your credit."
		end
	end

	def pay_with_plastic(user,amount)
		if @accounts.has_key?(user)
			if @accounts[user][:cc_account] == true
				@accounts[user][:cc_total] += amount
				puts "#{user.name} now owes $#{@accounts[user][:cc_total]} on their credit card."
			else
				puts "#{user.name} does not have a credit card at #{@name} bank."
			end
		else
			puts "#{user.name} has no account at #{@name} bank. Please open an account, then a credit card account, and then try to pay with your credit card."
		end
	end

	def pay_off_plastic(user,amount,cash=true)
		if @accounts.has_key?(user)
			if @accounts[user][:cc_account] == true
				if cash 
					if amount < user.cash
						@accounts[user][:cc_total] -= amount
						user.cash -=amount
						puts "#{user.name} now owes $#{@accounts[user][:cc_total]} on their credit card and has $#{user.cash} on hand."
					else
						puts "#{user.name} does not have $#{amount} on hand."
					end
				elsif !cash
					if amount < @accounts[user][:cash]
						@accounts[user][:cc_total] -= amount
						@accounts[user][:cash] -= amount
						puts "#{user.name} now owes $#{@accounts[user][:cc_total]} on their credit card and has $#{accounts[user][:cash]} in their account."
					else
						puts "#{user.name} does not have $#{@accounts[user][:cash]} in their account."
					end
				end
			else
				puts "#{user.name} does not have a credit card at #{@name} bank."
			end
		else
			puts "#{user.name} has no account at #{@name} bank. Please open an account, then a credit card account, then try to pay with your credit card, and then try to pay off your credit card debt."
		end
	end

	def close_credit_account(user)
		if @accounts.has_key?(user)
			if @accounts[user][:cc_account] == true
				if @accounts[user][:cc_total] > 0
					puts "#{user.name}, please pay off your credit card debt of $#{@accounts[user][:cc_total]}."
				else
					@accounts[user][:cc_account] = false
					puts "You have closed your credit card account at #{@name} bank."
				end
			elsif @accounts[user][:cc_account] == false
				puts "#{user.name} doesn't have a credit card account at this bank to close."
			end
		else
			puts "#{user.name} has no account at #{@name} bank."
		end
	end
end

# tests of basic functionality
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.transfer(me, wells_fargo, 100)
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

# tests of failure states
# test = Person.new("Ben", 500)
# chase.deposit(test,500)
# chase.withdraw(test,500)
# chase.open_account(test)
# chase.deposit(test,1000)
# chase.deposit(test,500)
# chase.withdraw(test,1000)
# chase.transfer(test, wells_fargo, 1000)
# wells_fargo.open_account(test)
# chase.transfer(test, wells_fargo, 1000)

# tests of extension functionality
chase.open_credit_account(me)
chase.check_credit(me)
chase.pay_with_plastic(me,50)
chase.check_credit(me)
chase.close_credit_account(me)
chase.deposit(me,50)
chase.pay_off_plastic(me,50,false)
chase.check_credit(me)
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank
chase.check_credit(friend1)
chase.open_credit_account(friend1)
chase.pay_with_plastic(friend1,200)
chase.pay_with_plastic(me,50)
puts chase.total_credit_owed_to_bank
puts wells_fargo.total_credit_owed_to_bank
