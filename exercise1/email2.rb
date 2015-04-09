#Paulo Mendes Email a6603
#Email2
class Email
	#attr_accessor:subject,:date,:from
	def initialize (subject, headers)
		@subject=subject
		@headers=headers
		#@from=from
	end

	def subject
		@subject
	end
	
	def date
		@headers[:date]
	end
	def from
		@headers[:from]
	end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"