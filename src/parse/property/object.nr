use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;

#[test]
fn left_brace()
{
    assert(can_parse_as_property("{") == false);
}

#[test]
fn right_brace()
{
    assert(can_parse_as_property("}") == false);
}

#[test]
fn left_brace_and_number()
{
    assert(can_parse_as_property("{12") == false);
}

#[test]
fn right_brace_and_number()
{
    assert(can_parse_as_property("12}") == false);
}

#[test]
fn left_brace_and_literal()
{
    assert(can_parse_as_property("{true") == false);
}

#[test]
fn right_brace_and_literal()
{
    assert(can_parse_as_property("true}") == false);
}

#[test]
fn left_brace_and_number_quote()
{
    assert(can_parse_as_property("{{}") == false);
}

#[test]
fn quote_right_brace_and_number()
{
    assert(can_parse_as_property("{}}") == false);
}

#[test]
fn quote_left_brace()
{
    assert(can_parse_as_property("\"{") == false);
}

#[test]
fn right_brace_quote()
{
    assert(can_parse_as_property("}\"") == false);
}

#[test]
fn empty_colon()
{
    assert(can_parse_as_property("{:}") == false);
}

#[test]
fn empty_comma()
{
    assert(can_parse_as_property("{,}") == false);
}

#[test]
fn empty_key()
{
    assert(can_parse_as_property("{\"\"}") == false);
}

#[test]
fn empty_key_with_colon()
{
    assert(can_parse_as_property("{\"\":}") == false);
}

#[test]
fn empty_space_empty()
{
    assert(can_parse_as_property("{} {}") == false);
}

#[test]
fn empty_comma_empty()
{
    assert(can_parse_as_property("{},{}") == false);
}

#[test]
fn key_with_colon_missing_value()
{
    assert(can_parse_as_property(r#"{"a":}"#) == false);
}

#[test]
fn missing_key_with_value()
{
    assert(can_parse_as_property("{:1}") == false);
}

#[test]
fn empty_key_with_value()
{
    assert(can_parse_as_property(r#"{"":1}"#) == false);
}

#[test]
fn colon_before_key()
{
    assert(can_parse_as_property(r#"{:"a":1}"#) == false);
}

#[test]
fn quote_before_key()
{
    assert(can_parse_as_property(r#"{""a":1}"#) == false);
}

#[test]
fn quote_after_key()
{
    assert(can_parse_as_property(r#"{"a"":1}"#) == false);
}

#[test]
fn left_brace_before_key()
{
    assert(can_parse_as_property(r#"{{"a":1}"#) == false);
}

#[test]
fn left_brace_after_key()
{
    assert(can_parse_as_property(r#"{"a"{:1}"#) == false);
}

#[test]
fn right_brace_before_key()
{
    assert(can_parse_as_property(r#"{}"a":1}"#) == false);
}

#[test]
fn right_brace_after_key()
{
    assert(can_parse_as_property(r#"{"a"}:1}"#) == false);
}

#[test]
fn left_bracket_before_key()
{
    assert(can_parse_as_property(r#"{["a":1}"#) == false);
}

#[test]
fn left_bracket_after_key()
{
    assert(can_parse_as_property(r#"{"a"[:1}"#) == false);
}

#[test]
fn right_bracket_before_key()
{
    assert(can_parse_as_property(r#"{]"a":1}"#) == false);
}

#[test]
fn right_bracket_after_key()
{
    assert(can_parse_as_property(r#"{"a"]:1}"#) == false);
}

#[test]
fn leading_comma()
{
    assert(can_parse_as_property(r#"{,"a":1}"#) == false);
}

#[test]
fn comma_after_key()
{
    assert(can_parse_as_property(r#"{"a",:1}"#) == false);
}

#[test]
fn comma_after_colon()
{
    assert(can_parse_as_property(r#"{"a":,1}"#) == false);
}

#[test]
fn trailing_comma()
{
    assert(can_parse_as_property(r#"{"a":1,}"#) == false);
}

#[test]
fn one_comma_minus()
{
    assert(can_parse_as_property(r#"{"a":1,-}"#) == false);
}

#[test]
fn empty_key_second_key()
{
    assert(can_parse_as_property(r#"{"a":1,""}"#) == false);
}

#[test]
fn missing_colon_second_key()
{
    assert(can_parse_as_property(r#"{"a":1,"b"}"#) == false);
}

#[test]
fn missing_value_second_key()
{
    assert(can_parse_as_property(r#"{"a":1,"b":}"#) == false);
}

#[test]
fn faulty_minus_second_key()
{
    assert(can_parse_as_property(r#"{"a":1,"b":-}"#) == false);
}

#[test]
unconstrained
fn property_key_object_empty_and_key_number()
{
    let json = JSON::parse(r#"{"a":{},"b":1}"#);

    assert(json.doc.len() == 2);

    assert(json.children.len() == 1);
    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn property_key_number_and_key_array_object()
{
    let json = JSON::parse(r#"{"a":1,"b":{}}"#);

    assert(json.doc.len() == 2);

    assert(json.children.len() == 1);
    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn single_character_key_with_value()
{
    assert(JSON::parse(r#"{"a":{"b":1}}"#).get_object("a").get("b").eq_string("1") == true);
}

#[test]
unconstrained
fn multi_character_key_with_value()
{
    assert(JSON::parse(r#"{"a":{"abc":1}}"#).get_object("a").get("abc").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_colon()
{
    assert(JSON::parse(r#"{"a":{"b:":1}}"#).get_object("a").get("b:").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_space()
{
    assert(JSON::parse(r#"{"a":{"b ":1}}"#).get_object("a").get("b ").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_right_brace()
{
    assert(JSON::parse(r#"{"a":{"b}":1}}"#).get_object("a").get("b}").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_left_brace()
{
    assert(JSON::parse(r#"{"a":{"b{":1}}"#).get_object("a").get("b{").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_right_bracket()
{
    assert(JSON::parse(r#"{"a":{"b]":1}}"#).get_object("a").get("b]").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_left_bracket()
{
    assert(JSON::parse(r#"{"a":{"b[":1}}"#).get_object("a").get("b[").eq_string("1") == true);
}

#[test]
unconstrained
fn empty()
{
    assert(JSON::parse(r#"{"a":{}}"#).get_object("a").is_empty() == true);
}

#[test]
unconstrained
fn two_keys()
{
    let json = JSON::parse(r#"{"a":{"abc":1},"b":{"abc":2}}"#);

    assert(json.doc.len() == 2);
    assert(json.children.len() == 2);

    assert(json.child(0).get("abc").eq_string("1") == true);
    assert(json.child(1).get("abc").eq_string("2") == true);
}

// TODO: fix this
#[test]
unconstrained
fn two_keys_same_name_replace_property()
{
    let json = JSON::parse(r#"{"a":{"abc":1},"a":{"abc":2}}"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2); // TODO: 1

    assert(json.child(1).get("abc").eq_string("2") == true);
}

#[test]
unconstrained
fn three_keys_unique_values()
{
    let json = JSON::parse(r#"{"a":{"name":"John Doe","age":30,"isEmployed":true}}"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    let object = json.get_object("a");

    assert(object.doc.len() == 3);
    assert(object.get("name").eq_string("\"John Doe\"") == true);
    assert(object.get("age").eq_string("30") == true);
    assert(object.get("isEmployed").eq_string("true") == true);
}
