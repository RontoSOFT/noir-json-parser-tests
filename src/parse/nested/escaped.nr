use dep::rontosoft::JSON;

use crate::utils::can_parse_as_nested;

#[test]
fn nested_value_tab()
{
    assert(can_parse_as_nested("\t") == false);
}

#[test]
fn nested_value_newline()
{
    assert(can_parse_as_nested("\n") == false);
}

#[test]
fn nested_value_carriage_return()
{
    assert(can_parse_as_nested("\r") == false);
}

#[test]
fn nested_value_byte_null()
{
    assert(can_parse_as_nested("\0") == false);
}

#[test]
fn with_escaped_quotation_mark_left()
{
    assert(can_parse_as_nested(r#""\"string""#) == true);
}

#[test]
fn with_escaped_quotation_mark_right()
{
    assert(can_parse_as_nested(r#""string\"""#) == true);
}

#[test]
fn with_escaped_quotation_mark_middle()
{
    assert(can_parse_as_nested(r#""str\"ing""#) == true);
}

#[test]
fn with_escaped_quotation_mark_both()
{
    assert(can_parse_as_nested(r#""\"string\"""#) == true);
}

#[test]
unconstrained
fn nested_empty_object_with_trailing_null()
{
    assert(JSON::parse("{\"a\":{\"b\":{}}}\0").get_object("a").get_object("b").is_empty() == true);
}

#[test]
fn nested_empty_object_with_trailing_nulls()
{
    assert(can_parse_as_nested("{}\0\0") == false);
}

#[test]
fn nested_empty_object_with_leading_null()
{
    assert(can_parse_as_nested("\0{}") == false);
}

#[test]
fn nested_empty_object_with_null_misplaced()
{
    assert(can_parse_as_nested("{\0}") == false);
}

#[test]
unconstrained
fn nested_key_with_escaped_quotation_mark_left()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"b":{"\"a":"str"}}}"#).get_object("a").get_object("b").get("\\\"a").eq_string(value) == true);
}

#[test]
unconstrained
fn nested_key_with_escaped_quotation_mark_right()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"b":{"a\"":"str"}}}"#).get_object("a").get_object("b").get("a\\\"").eq_string(value) == true);
}

#[test]
unconstrained
fn nested_key_with_escaped_quotation_mark_middle()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"b":{"a\"b":"str"}}}"#).get_object("a").get_object("b").get("a\\\"b").eq_string(value) == true);
}

#[test]
unconstrained
fn nested_key_with_escaped_quotation_mark_both()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"b":{"\"a\"":"str"}}}"#).get_object("a").get_object("b").get("\\\"a\\\"").eq_string(value) == true);
}
