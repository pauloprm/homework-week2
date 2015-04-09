#Paulo Mendes Email a6603
#MailBox
class Email
	attr_accessor:subject,:date,:from
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

class Mailbox
	attr_accessor:namegroup,:emails
	def initialize (namegroup, emails)
		@namegroup=namegroup
		@emails=emails
	end
  # fill in this class body
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end