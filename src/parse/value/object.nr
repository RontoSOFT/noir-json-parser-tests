use dep::rontosoft::JSON;

use crate::utils::can_parse_as_value;

#[test]
fn value_object_left_brace()
{
    assert(can_parse_as_value("{") == false);
}

#[test]
fn value_object_right_brace()
{
    assert(can_parse_as_value("}") == false);
}

#[test]
fn value_object_quote_left_brace()
{
    assert(can_parse_as_value("'{") == false);
}

#[test]
fn value_object_right_brace_quote()
{
    assert(can_parse_as_value("}'") == false);
}

#[test]
fn value_object_empty_colon()
{
    assert(can_parse_as_value("{:}") == false);
}

#[test]
fn value_object_empty_comma()
{
    assert(can_parse_as_value("{,}") == false);
}

#[test]
fn value_object_empty_key()
{
    assert(can_parse_as_value("{''}") == false);
}

#[test]
fn value_object_empty_key_with_colon()
{
    assert(can_parse_as_value("{'':}") == false);
}

#[test]
fn value_object_empty_space_empty()
{
    assert(can_parse_as_value("{} {}") == false);
}

#[test]
fn value_object_empty_comma_empty()
{
    assert(can_parse_as_value("{},{}") == false);
}

#[test]
fn value_object_key_with_colon_missing_value()
{
    assert(can_parse_as_value("{'a':}") == false);
}

#[test]
fn value_object_missing_key_with_value()
{
    assert(can_parse_as_value("{:1}") == false);
}

#[test]
fn value_object_empty_key_with_value()
{
    assert(can_parse_as_value("{'':1}") == false);
}

#[test]
fn value_object_faulty_colon()
{
    assert(can_parse_as_value("{:'a':1}") == false);
}

#[test]
fn value_object_quote_before_key()
{
    assert(can_parse_as_value("{''a':1}") == false);
}

#[test]
fn value_object_quote_after_key()
{
    assert(can_parse_as_value("{'a'':1}") == false);
}

#[test]
fn value_object_left_brace_before_key()
{
    assert(can_parse_as_value("{{'a':1}") == false);
}

#[test]
fn value_object_left_brace_after_key()
{
    assert(can_parse_as_value("{'a'{:1}") == false);
}

#[test]
fn value_object_right_brace_before_key()
{
    assert(can_parse_as_value("{}'a':1}") == false);
}

#[test]
fn value_object_right_brace_after_key()
{
    assert(can_parse_as_value("{'a'}:1}") == false);
}

#[test]
fn value_object_left_bracket_before_key()
{
    assert(can_parse_as_value("{['a':1}") == false);
}

#[test]
fn value_object_left_bracket_after_key()
{
    assert(can_parse_as_value("{'a'[:1}") == false);
}

#[test]
fn value_object_right_bracket_before_key()
{
    assert(can_parse_as_value("{]'a':1}") == false);
}

#[test]
fn value_object_right_bracket_after_key()
{
    assert(can_parse_as_value("{'a']:1}") == false);
}

#[test]
fn value_object_leading_comma()
{
    assert(can_parse_as_value("{,'a':1}") == false);
}

#[test]
fn value_object_comma_after_key()
{
    assert(can_parse_as_value("{'a',:1}") == false);
}

#[test]
fn value_object_comma_after_colon()
{
    assert(can_parse_as_value("{'a':,1}") == false);
}

#[test]
fn value_object_trailing_comma()
{
    assert(can_parse_as_value("{'a':1,}") == false);
}

#[test]
fn value_object_one_comma_minus()
{
    assert(can_parse_as_value("{'a':1,-}") == false);
}

#[test]
fn value_object_empty_key_second_key()
{
    assert(can_parse_as_value("{'a':1,''}") == false);
}

#[test]
fn value_object_missing_colon_second_key()
{
    assert(can_parse_as_value("{'a':1,'b'}") == false);
}

#[test]
fn value_object_missing_value_second_key()
{
    assert(can_parse_as_value("{'a':1,'b':}") == false);
}

#[test]
fn value_object_faulty_minus_second_key()
{
    assert(can_parse_as_value("{'a':1,'b':-}") == false);
}

#[test]
unconstrained
fn value_object_single_character_key_with_value()
{
    assert(JSON::parse("{'a':1}").get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_multi_character_key_with_value()
{
    assert(JSON::parse("{'abc':1}").get("abc").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_colon()
{
    assert(JSON::parse("{'a:':1}").get("a:").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_space()
{
    assert(JSON::parse("{'a ':1}").get("a ").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_right_brace()
{
    assert(JSON::parse("{'a}':1}").get("a}").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_left_brace()
{
    assert(JSON::parse("{'a{':1}").get("a{").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_right_bracket()
{
    assert(JSON::parse("{'a]':1}").get("a]").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_left_bracket()
{
    assert(JSON::parse("{'a[':1}").get("a[").eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_empty()
{
    assert(JSON::parse("{}").is_empty() == true);
}

#[test]
unconstrained
fn value_object_two_keys()
{
    let json = JSON::parse("{'a':1,'b':2}");

    assert(json.get("a").eq_string("1") == true);
    assert(json.get("b").eq_string("2") == true);
}

#[test]
unconstrained
fn value_object_two_keys_same_name_replace_property()
{
    assert(JSON::parse("{'a':1,'a':2}").get("a").eq_string("2") == true);
}

#[test]
unconstrained
fn value_object_three_keys_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}");

    assert(json.doc.len() == 3);

    assert(json.get("name").eq_string("'John Doe'") == true);
    assert(json.get("age").eq_string("30") == true);
    assert(json.get("isEmployed").eq_string("true") == true);
}
