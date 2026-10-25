// Builds a validator and validates a valid and an invalid document. On Windows this also
// checks the library is a release build: a Debug DLL crashes when used from release code.
#include <iostream>
#include <nlohmann/json-schema.hpp>

int main()
{
  const nlohmann::json schema = R"({
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {"name": {"type": "string"}, "count": {"type": "integer", "minimum": 0}},
    "required": ["name"]
  })"_json;

  nlohmann::json_schema::json_validator validator(schema);
  validator.validate(R"({"name": "a", "count": 1})"_json);
  try
  {
    validator.validate(R"({"count": -1})"_json);
  }
  catch (const std::exception& e)
  {
    std::cout << "invalid document rejected: " << e.what() << std::endl;
    return 0;
  }
  std::cerr << "invalid document was accepted" << std::endl;
  return 1;
}
