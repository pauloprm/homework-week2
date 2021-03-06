#Paulo Mendes Email a6603
#MailBox exercice3
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

	def namegroup
		@namegroup
	end

	def emails
		@emails
	end
  # fill in this class body
end

class MailboxTextFormatter
	#attr_accessor:mailbox
	def initialize (mailbox)
		@mailbox = mailbox
	end

	def format
		lines = [
		separator,
		format_row(["Date", "From", "Subject"]),
		separator,
		rows.collect { |row| format_row(row) },
		separator,
		]
		lines.join("\n")
	end

	def separator
		"+#{column_widths.map { |width| '-' * (width + 2) }.join("+")}+"
	end

	def format_row(row)
		cells = 0.upto(row.length - 1).map do |ix|
			row[ix].ljust(column_widths[ix])
		end
		"| #{cells.join(" | ")} |"
	end

	def emails
		@mailbox.emails
	end

	def column_widths
		columns.map { |column| column.max_by { |cell| cell.length }.length }
	end

	def columns
		rows.transpose
	end

	def rows
		emails.collect { |email| [email.date, email.from, email.subject] }
	end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format

#mailbox.emails.each do |email|
#  puts "Date:    #{email.date}"
#  puts "From:    #{email.from}"
#  puts "Subject: #{email.subject}"
#  puts
#end