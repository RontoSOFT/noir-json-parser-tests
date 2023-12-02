use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;

#[test]
fn property_value_tab()
{
    assert(can_parse_as_property("\t") == false);
}

#[test]
fn property_value_newline()
{
    assert(can_parse_as_property("\n") == false);
}

#[test]
fn property_value_carriage_return()
{
    assert(can_parse_as_property("\r") == false);
}

#[test]
fn property_value_byte_null()
{
    assert(can_parse_as_property("\0") == false);
}

#[test]
fn property_string_with_escaped_quotation_mark_left()
{
    assert(can_parse_as_property(r#""\"string""#) == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_right()
{
    assert(can_parse_as_property(r#""string\"""#) == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_middle()
{
    assert(can_parse_as_property(r#""str\"ing""#) == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_both()
{
    assert(can_parse_as_property(r#""\"string\"""#) == true);
}

#[test]
unconstrained
fn property_empty_object_with_trailing_null()
{
    assert(JSON::parse("{\"a\":{}}\0").get_object("a").is_empty() == true);
}

#[test]
fn property_empty_object_with_trailing_nulls()
{
    assert(can_parse_as_property("{}\0\0") == false);
}

#[test]
fn property_empty_object_with_leading_null()
{
    assert(can_parse_as_property("\0{}") == false);
}

#[test]
fn property_empty_object_with_null_misplaced()
{
    assert(can_parse_as_property("{\0}") == false);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_left()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"\"a":"str"}}"#).get_object("a").get("\\\"a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_right()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"a\"":"str"}}"#).get_object("a").get("a\\\"").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_middle()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"a\"b":"str"}}"#).get_object("a").get("a\\\"b").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_both()
{
    let value = "\"str\"";
    assert(JSON::parse(r#"{"a":{"\"a\"":"str"}}"#).get_object("a").get("\\\"a\\\"").eq_string(value) == true);
}
