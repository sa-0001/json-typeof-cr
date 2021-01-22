# json-typeof

This adds instance method `#typeof` to `JSON::Any`, which returns the type of the underlying JSON, according to the [OpenAPI/Swagger](https://swagger.io/docs/specification/data-models/data-types/) variant of JSON Schema (*).

(*) in Javascript, `typeof 1.2` and `typeof 12` both return `number`, however this method returns `number` and `integer` respectively, in line with OpenAPI/Swagger

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  json-typeof:
    github: sa-0001/json-typeof-cr
```

## Usage & Examples

```crystal
require "json-typeof"

json_value = JSON.parse %([1,2,3])
p json_value.typeof == JSON::Typeof::Array
p json_value.typeof.to_s == "array"

json_value = JSON.parse %(true)
p json_value.typeof == JSON::Typeof::Boolean
p json_value.typeof.to_s == "boolean"

json_value = JSON.parse %(123)
p json_value.typeof == JSON::Typeof::Integer
p json_value.typeof.to_s == "integer"

json_value = JSON.parse %(null)
p json_value.typeof == JSON::Typeof::Null
p json_value.typeof.to_s == "null"

json_value = JSON.parse %(1.23)
p json_value.typeof == JSON::Typeof::Number
p json_value.typeof.to_s == "number"

json_value = JSON.parse %({"a":"b"})
p json_value.typeof == JSON::Typeof::Object
p json_value.typeof.to_s == "object"

json_value = JSON.parse %("abc")
p json_value.typeof == JSON::Typeof::String
p json_value.typeof.to_s == "string"
```
