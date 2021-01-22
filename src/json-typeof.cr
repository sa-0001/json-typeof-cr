require "json"

##======================================================================================================================

enum JSON::Typeof
	Array
	Boolean
	Integer
	Null
	Number
	Object
	String
	
	def self.from_s (str)
		return case str
			when "array"   then JSON::Typeof::Array
			when "boolean" then JSON::Typeof::Boolean
			when "integer" then JSON::Typeof::Integer
			when "null"    then JSON::Typeof::Null
			when "number"  then JSON::Typeof::Number
			when "object"  then JSON::Typeof::Object
			when "string"  then JSON::Typeof::String
			else raise %(JSON::Typeof - unknown value "#{str}")
		end
	end
	def to_json (io)
		io << '"'
		to_s io
		io << '"'
	end
	def to_s
		super.downcase
	end
	def to_s (io)
		io << to_s
	end
end

struct JSON::Any
	def typeof
		return JSON::Typeof::Array   if @raw.is_a? Array
		return JSON::Typeof::Boolean if @raw.is_a? Bool
		return JSON::Typeof::Integer if @raw.is_a? Int
		return JSON::Typeof::Number  if @raw.is_a? Float
		return JSON::Typeof::Object  if @raw.is_a? Hash
		return JSON::Typeof::String  if @raw.is_a? String
		return JSON::Typeof::Null
	end
end
