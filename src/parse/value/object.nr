use dep::rontosoft::JSON;

use crate::utils::can_parse_as_value;

#[test]
fn left_brace()
{
    assert(can_parse_as_value("{") == false);
}

#[test]
fn right_brace()
{
    assert(can_parse_as_value("}") == false);
}

#[test]
fn left_brace_and_number()
{
    assert(can_parse_as_value("{12") == false);
}

#[test]
fn right_brace_and_number()
{
    assert(can_parse_as_value("12}") == false);
}

#[test]
fn left_brace_and_literal()
{
    assert(can_parse_as_value("{true") == false);
}

#[test]
fn right_brace_and_literal()
{
    assert(can_parse_as_value("true}") == false);
}

#[test]
fn left_brace_and_number_quote()
{
    assert(can_parse_as_value("{{}") == false);
}

#[test]
fn quote_right_brace_and_number()
{
    assert(can_parse_as_value("{}}") == false);
}

#[test]
fn quote_left_brace()
{
    assert(can_parse_as_value("\"{") == false);
}

#[test]
fn right_brace_quote()
{
    assert(can_parse_as_value("}\"") == false);
}

#[test]
fn empty_colon()
{
    assert(can_parse_as_value("{:}") == false);
}

#[test]
fn empty_comma()
{
    assert(can_parse_as_value("{,}") == false);
}

#[test]
fn empty_key()
{
    assert(can_parse_as_value("{\"\"}") == false);
}

#[test]
fn empty_key_with_colon()
{
    assert(can_parse_as_value("{\"\":}") == false);
}

#[test]
fn empty_space_empty()
{
    assert(can_parse_as_value("{} {}") == false);
}

#[test]
fn empty_comma_empty()
{
    assert(can_parse_as_value("{},{}") == false);
}

#[test]
fn key_with_colon_missing_value()
{
    assert(can_parse_as_value(r#"{"a":}"#) == false);
}

#[test]
fn missing_key_with_value()
{
    assert(can_parse_as_value("{:1}") == false);
}

#[test]
fn empty_key_with_value()
{
    assert(can_parse_as_value(r#"{"":1}"#) == false);
}

#[test]
fn colon_before_key()
{
    assert(can_parse_as_value(r#"{:"a":1}"#) == false);
}

#[test]
fn quote_before_key()
{
    assert(can_parse_as_value(r#"{""a":1}"#) == false);
}

#[test]
fn quote_after_key()
{
    assert(can_parse_as_value(r#"{"a"":1}"#) == false);
}

#[test]
fn left_brace_before_key()
{
    assert(can_parse_as_value(r#"{{"a":1}"#) == false);
}

#[test]
fn left_brace_after_key()
{
    assert(can_parse_as_value(r#"{"a"{:1}"#) == false);
}

#[test]
fn right_brace_before_key()
{
    assert(can_parse_as_value(r#"{}"a":1}"#) == false);
}

#[test]
fn right_brace_after_key()
{
    assert(can_parse_as_value(r#"{"a"}:1}"#) == false);
}

#[test]
fn left_bracket_before_key()
{
    assert(can_parse_as_value(r#"{["a":1}"#) == false);
}

#[test]
fn left_bracket_after_key()
{
    assert(can_parse_as_value(r#"{"a"[:1}"#) == false);
}

#[test]
fn right_bracket_before_key()
{
    assert(can_parse_as_value(r#"{]"a":1}"#) == false);
}

#[test]
fn right_bracket_after_key()
{
    assert(can_parse_as_value(r#"{"a"]:1}"#) == false);
}

#[test]
fn leading_comma()
{
    assert(can_parse_as_value(r#"{,"a":1}"#) == false);
}

#[test]
fn comma_after_key()
{
    assert(can_parse_as_value(r#"{"a",:1}"#) == false);
}

#[test]
fn comma_after_colon()
{
    assert(can_parse_as_value(r#"{"a":,1}"#) == false);
}

#[test]
fn trailing_comma()
{
    assert(can_parse_as_value(r#"{"a":1,}"#) == false);
}

#[test]
fn one_comma_minus()
{
    assert(can_parse_as_value(r#"{"a":1,-}"#) == false);
}

#[test]
fn empty_key_second_key()
{
    assert(can_parse_as_value(r#"{"a":1,""}"#) == false);
}

#[test]
fn missing_colon_second_key()
{
    assert(can_parse_as_value(r#"{"a":1,"b"}"#) == false);
}

#[test]
fn missing_value_second_key()
{
    assert(can_parse_as_value(r#"{"a":1,"b":}"#) == false);
}

#[test]
fn faulty_minus_second_key()
{
    assert(can_parse_as_value(r#"{"a":1,"b":-}"#) == false);
}

#[test]
unconstrained
fn single_character_key_with_value()
{
    assert(JSON::parse(r#"{"a":1}"#).get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn multi_character_key_with_value()
{
    assert(JSON::parse(r#"{"abc":1}"#).get("abc").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_colon()
{
    assert(JSON::parse(r#"{"a:":1}"#).get("a:").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_space()
{
    assert(JSON::parse(r#"{"a ":1}"#).get("a ").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_right_brace()
{
    assert(JSON::parse(r#"{"a}":1}"#).get("a}").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_left_brace()
{
    assert(JSON::parse(r#"{"a{":1}"#).get("a{").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_right_bracket()
{
    assert(JSON::parse(r#"{"a]":1}"#).get("a]").eq_string("1") == true);
}

#[test]
unconstrained
fn key_with_left_bracket()
{
    assert(JSON::parse(r#"{"a[":1}"#).get("a[").eq_string("1") == true);
}

#[test]
unconstrained
fn empty()
{
    assert(JSON::parse("{}").is_empty() == true);
}

#[test]
unconstrained
fn two_keys()
{
    let json = JSON::parse(r#"{"a":1,"b":2}"#);

    assert(json.get("a").eq_string("1") == true);
    assert(json.get("b").eq_string("2") == true);
}

#[test]
unconstrained
fn two_keys_same_name_replace_property()
{
    assert(JSON::parse(r#"{"a":1,"a":2}"#).get("a").eq_string("2") == true);
}

#[test]
unconstrained
fn three_keys_unique_values()
{
    let json = JSON::parse(r#"{"name":"John Doe","age":30,"isEmployed":true}"#);

    assert(json.doc.len() == 3);

    assert(json.get("name").eq_string("\"John Doe\"") == true);
    assert(json.get("age").eq_string("30") == true);
    assert(json.get("isEmployed").eq_string("true") == true);
}
