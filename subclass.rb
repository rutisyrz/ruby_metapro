# parent class
class DocumentReader
	@reader_classes = []
	
	class << self
		attr_reader :reader_classes
	
		def inherited( subclass )
			DocumentReader.reader_classes << subclass
			puts "=== Added new subclass - #{subclass}"
		end
		
		def reader_for(path)
			reader_class =  DocumentReader.reader_classes.find do |klass|
								klass.can_read?(path)
							end
							
			return reader_class.new(path) if reader_class
			nil
		end
	end
end

# txt files reader
class PlainTextReader < DocumentReader
	def self.can_read?(path)
		/.*\.txt/ =~ path
	end
	
	def initialize(path)
		@path = path
	end
	
	def read(path)
		File.open(path) do |f|
			title = f.readline.chomp
			author = f.readline.chomp
			content = f.read.chomp
			Document.new( title, author, content )
		end
	end
end

# yml files reader
class YAMLReader < DocumentReader
	def self.can_read?(path)
		/.*\.yaml/ =~ path
	end
	
	def initialize(path)
		@path = path
	end
	
	def read(path)
		# ...
	end
end

# xml files reader
class XMLReader < DocumentReader
	def self.can_read?(path)
		/.*\.xml/ =~ path
	end
	
	def initialize(path)
		@path = path
	end
	
	def read(path)
		# ...
	end
end


