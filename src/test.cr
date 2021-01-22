#!/usr/bin/env crystal

require "tap"

require "./json-typeof"

##======================================================================================================================

Tap.test "json-typeof" do |t|
	
	raw = JSON.parse %([])
	t.eq raw.typeof, JSON::Typeof::Array
	
	raw = JSON.parse %(true)
	t.eq raw.typeof, JSON::Typeof::Boolean
	
	raw = JSON.parse %(0)
	t.eq raw.typeof, JSON::Typeof::Integer
	
	raw = JSON.parse %(null)
	t.eq raw.typeof, JSON::Typeof::Null
	
	raw = JSON.parse %(0.0)
	t.eq raw.typeof, JSON::Typeof::Number
	
	raw = JSON.parse %({})
	t.eq raw.typeof, JSON::Typeof::Object
	
	raw = JSON.parse %("")
	t.eq raw.typeof, JSON::Typeof::String
	
	# enum value to_json/to_s
	raw = JSON.parse %(null)
	t.eq raw.typeof.to_json, %("null")
	t.eq raw.typeof.to_s, %(null)
end
