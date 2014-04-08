
class Document
  def initialize
    puts "New document initialized."
  end

  def method_missing(method_name, *args)
    puts "You tried calling \"#{method_name}\" method with params (#{args.join(', ')}) for document. There is no such method."
  end
end

doc = Document.new
doc.write("Ruby Meta", "Ruby", "Pub")
