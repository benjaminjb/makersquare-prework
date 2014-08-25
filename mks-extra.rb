######### CHIMP
class Chimpanzee

	def initialize
		@bananas_eaten = 0
		@is_clean = true
	end

	def yell
		puts "Monkey sounds!"
	end

	def eat
		puts "Ate a banana and got messy"
		@bananas_eaten += 1
		@is_clean = false
	end

	def bananas
		puts "I ate #{@bananas_eaten} bananas!"
	end

	def groom
		if @is_clean
			puts "You're not dirty...yet."
		else
			puts "Grooms self."
			@is_clean = true
		end
	end

end

##### TESTING

# bobo = Chimpanzee.new
# mollie = Chimpanzee.new
# ran = Chimpanzee.new

# bobo.yell
# bobo.bananas
# bobo.groom
# bobo.eat
# bobo.groom
# bobo.bananas

##### ROOMMATE

class Roommate
	@@total_beer_count = 0
	@@Roommates_total = 0
	@@roommates = []

	def initialize
		@beer_count = 0
		@@Roommates_total += 1
		@@roommates << self
	end

	def drink_beer
		@beer_count += 1
		@@total_beer_count += 1
		puts "Yumm"
	end

	def self.total_beer_count
		puts "Everyone has drunk #{@@total_beer_count} beers."
	end

	def self.average_beers
		puts "The average is #{@@total_beer_count.to_f / @@Roommates_total} beers per roommate."
	end

	def self.take_a_round
		@@roommates.each {|mate| mate.drink_beer}
	end

end

##### TESTING

# ben = Roommate.new
# Roommate.total_beer_count
# ben.drink_beer
# Roommate.total_beer_count
# Roommate.average_beers
# ben.drink_beer
# Roommate.average_beers
# kumail = Roommate.new
# kumail.drink_beer
# Roommate.total_beer_count
# Roommate.average_beers
# Roommate.take_a_round
# Roommate.total_beer_count
# Roommate.average_beers

######## BANK ACCOUNT

class BankAccount
	attr_accessor :amount_available
	attr_accessor :loan
	@@total_money_in_accounts = 0
	@@total_loans_out = 0
	@@pending_transactions = []

	def initialize(amount_available, loan = 0)
		@amount_available = amount_available
		@loan = loan
		@@total_money_in_accounts += amount_available
	end

	def deposit_money(value)
		@amount_available += value
		@@total_money_in_accounts += value
	end

	def withdraw_money(value)
		@amount_available -= value
		@@total_money_in_accounts -= value
	end

	def get_balance
		puts "Balance: #{@amount_available}"
	end

	def take_loan(amount)
		@loan += amount
		@@total_loans_out += amount
	end

	def repay_loan(amount)
		@loan -= amount
		@@total_loans_out -= amount
	end

	def accrue_interest
		interest = @loan * 0.06
		@loan += interest
		@@total_loans_out += interest
	end

	def get_outstanding_loan
		puts "Outstanding loan: #{@loan}."
	end

	def self.transfer_money(transaction)
		transaction.giver.withdraw_money(transaction.amount)
		transaction.taker.deposit_money(transaction.amount)
	end

	def self.set_transfer(transaction)
		@@pending_transactions << transaction
	end

	def self.total_cash_on_hand
		puts "Total money: #{@@total_money_in_accounts}."
		puts "Total loans: #{@@total_loans_out}."
		puts "Difference: #{@@total_money_in_accounts - @@total_loans_out}."
	end

	def self.execute_transactions
		@@pending_transactions.each do |transaction| 
			puts "Transaction: #{transaction.giver} transfers #{transaction.amount} to #{transaction.taker}."
			self.transfer_money(transaction)
		end
	end

	def self.merge_bank_accounts(account,other_account)
		account.deposit_money(other_account.amount_available)
		account.take_loan(other_account.loan)
		other_account.zero_out
	end

	def self.merge_bank_accounts2(account,other_account)
		balance = account.amount_available + other_account.amount_available
		loans = account.loan + other_account.loan
		# puts "Name of account please:"
		# name = gets.chomp 
		name_of_account = BankAccount.new(balance,loans)
		account.zero_out
		other_account.zero_out
	end

	def zero_out
		self.withdraw_money(@amount_available)
		self.repay_loan(@loan)
	end

end

class Transaction

	def initialize(giver,taker,amount)
		@giver = giver
		@taker = taker
		@amount = amount
	end

	def giver
		@giver
	end

	def taker
		@taker
	end

	def amount
		@amount
	end

end

######## TESTING

# ben = BankAccount.new(100)
# BankAccount.total_cash_on_hand
# ben.deposit_money(1000)
# BankAccount.total_cash_on_hand
# ben.withdraw_money(1000)
# BankAccount.total_cash_on_hand
# ben.get_balance
# ben.get_outstanding_loan
# kel = BankAccount.new(10)
# BankAccount.total_cash_on_hand
# ravi = BankAccount.new(1)
# ravi.take_loan(1000)
# BankAccount.total_cash_on_hand
# ravi.accrue_interest
# ravi.repay_loan(500)
# ravi.accrue_interest
# ravi.get_outstanding_loan
# BankAccount.total_cash_on_hand
# ben.get_balance
# ravi.get_balance
# payment = Transaction.new(ben,ravi,100)
# BankAccount.transfer_money(payment)
# ben.get_balance
# ravi.get_balance
# BankAccount.total_cash_on_hand

# BankAccount.set_transfer(payment)
# BankAccount.execute_transactions
# ben.get_balance
# ravi.get_balance

# BankAccount.total_cash_on_hand
# BankAccount.merge_bank_accounts(ben,ravi)
# ben.get_balance
# ravi.get_balance
# ben.get_outstanding_loan
# ravi.get_outstanding_loan
# BankAccount.total_cash_on_hand

# ben.take_loan(200)
# ben.get_balance
# ben.get_outstanding_loan
# ben.zero_out
# ben.get_balance
# ben.get_outstanding_loan


######## AIRPLANE 1 - restriction

class Airplane
	@@city_to_airplane_hash = {}

	attr_accessor :city

	def initialize(city,capacity)
		if (@@city_to_airplane_hash.has_key?(city))
			puts "There's already an airplane in #{city}. Please enter new city:"
			new_city = gets.chomp
			Airplane.new(new_city,capacity)
		else
			@city = city
			@capacity = capacity
			@@city_to_airplane_hash[city] = self
		end
	end

	def fly_to_city(destination)
		if (@@city_to_airplane_hash.has_key?(destination))
			puts "There's already an airplane in #{destination}."
		else
			puts "The plane from #{self.city} flies to #{destination}."
			@@city_to_airplane_hash.delete(self.city)
			@@city_to_airplane_hash[destination] = self
		end
	end

	def self.can_i_fly(source,destination)
		if (@@city_to_airplane_hash.has_key?(source) && !(@@city_to_airplane_hash.has_key?(destination)))
			puts "You can fly to #{destination} from #{source}"
		else
			return nil
		end
	end

	def self.planes?
		puts @@city_to_airplane_hash
	end

end

######## TESTING

# austin = Airplane.new("Austin",100)
# boston = Airplane.new("Boston",10)
# boston.fly_to_city("Austin")
# boston.fly_to_city("New York")
# Airplane.can_i_fly("New York","Austin")
# Airplane.can_i_fly("Austin","Boston")


######## AIRPLANE 2 - no restriction

class Airplanes
	@@city_to_airplane_hash = {}
	@@flight_plans = {}

	attr_accessor :city,:open_seats,:capacity

	def initialize(city,capacity)
		if (@@city_to_airplane_hash.has_key?(city))
			setup(city,capacity)
		else
			@@city_to_airplane_hash[city] = []
			setup(city,capacity)
		end
	end

	def setup(city,capacity)
		@city = city
		@capacity = capacity
		@open_seats = capacity
		@@city_to_airplane_hash[city] << self
	end

	def book_flight(destination)
		if @city == destination
			puts "You're already there!"
		elsif (@@flight_plans[self])
			if ((@@flight_plans[self][:destination] == destination) && (@open_seats > 0))
				@open_seats -= 1
			elsif ((@@flight_plans[self][:destination] == destination) && (@open_seats < 1))
				puts "There are no seats on this plane."
			else
				puts "This plane isn't going to #{destination}."
			end
		else
			@@flight_plans[self] = {:destination => destination}
			book_flight(destination)
		end	
	end

	def self.fly
		@@flight_plans.each do |flights,details|
			puts "A plane flies from #{flights.city} to #{details[:destination]} with #{flights.capacity - flights.open_seats} people."
			@@city_to_airplane_hash[flights.city].delete(flights)
			flights.city = details[:destination]
			@@city_to_airplane_hash.has_key?(flights.city) ? @@city_to_airplane_hash[flights.city] << flights : @@city_to_airplane_hash[flights.city] = [flights]
			flights.open_seats = flights.capacity
		end
	end

	def self.planes?
		puts @@city_to_airplane_hash
	end

end

######## TESTING
# austin = Airplanes.new("Austin",100)
# boston = Airplanes.new("Boston",10)
# austin2 = Airplanes.new("Austin",1)
# austin.book_flight("Boston")
# austin.book_flight("New York")
# austin2.book_flight("San Francisco")
# austin2.book_flight("San Francisco")
# Airplanes.planes?
# Airplanes.fly
# Airplanes.planes?

