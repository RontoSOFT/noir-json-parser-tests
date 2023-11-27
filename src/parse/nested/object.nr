use dep::rontosoft::JSON;

use crate::utils::can_parse_as_nested;

#[test]
fn nested_object_left_brace()
{
    assert(can_parse_as_nested("{") == false);
}

#[test]
fn nested_object_right_brace()
{
    assert(can_parse_as_nested("}") == false);
}

#[test]
fn nested_object_left_brace_and_number()
{
    assert(can_parse_as_nested("{12") == false);
}

#[test]
fn nested_object_right_brace_and_number()
{
    assert(can_parse_as_nested("12}") == false);
}

#[test]
fn nested_object_left_brace_and_literal()
{
    assert(can_parse_as_nested("{true") == false);
}

#[test]
fn nested_object_right_brace_and_literal()
{
    assert(can_parse_as_nested("true}") == false);
}

#[test]
fn nested_object_left_brace_and_number_quote()
{
    assert(can_parse_as_nested("{{}") == false);
}

#[test]
fn nested_object_quote_right_brace_and_number()
{
    assert(can_parse_as_nested("{}}") == false);
}

#[test]
fn nested_object_quote_left_brace()
{
    assert(can_parse_as_nested("'{") == false);
}

#[test]
fn nested_object_right_brace_quote()
{
    assert(can_parse_as_nested("}'") == false);
}

#[test]
fn nested_object_empty_colon()
{
    assert(can_parse_as_nested("{:}") == false);
}

#[test]
fn nested_object_empty_comma()
{
    assert(can_parse_as_nested("{,}") == false);
}

#[test]
fn nested_object_empty_key()
{
    assert(can_parse_as_nested("{''}") == false);
}

#[test]
fn nested_object_empty_key_with_colon()
{
    assert(can_parse_as_nested("{'':}") == false);
}

#[test]
fn nested_object_empty_space_empty()
{
    assert(can_parse_as_nested("{} {}") == false);
}

#[test]
fn nested_object_empty_comma_empty()
{
    assert(can_parse_as_nested("{},{}") == false);
}

#[test]
fn nested_object_key_with_colon_missing_value()
{
    assert(can_parse_as_nested("{'a':}") == false);
}

#[test]
fn nested_object_missing_key_with_value()
{
    assert(can_parse_as_nested("{:1}") == false);
}

#[test]
fn nested_object_empty_key_with_value()
{
    assert(can_parse_as_nested("{'':1}") == false);
}

#[test]
fn nested_object_faulty_colon()
{
    assert(can_parse_as_nested("{:'a':1}") == false);
}

#[test]
fn nested_object_quote_before_key()
{
    assert(can_parse_as_nested("{''a':1}") == false);
}

#[test]
fn nested_object_quote_after_key()
{
    assert(can_parse_as_nested("{'a'':1}") == false);
}

#[test]
fn nested_object_left_brace_before_key()
{
    assert(can_parse_as_nested("{{'a':1}") == false);
}

#[test]
fn nested_object_left_brace_after_key()
{
    assert(can_parse_as_nested("{'a'{:1}") == false);
}

#[test]
fn nested_object_right_brace_before_key()
{
    assert(can_parse_as_nested("{}'a':1}") == false);
}

#[test]
fn nested_object_right_brace_after_key()
{
    assert(can_parse_as_nested("{'a'}:1}") == false);
}

#[test]
fn nested_object_left_bracket_before_key()
{
    assert(can_parse_as_nested("{['a':1}") == false);
}

#[test]
fn nested_object_left_bracket_after_key()
{
    assert(can_parse_as_nested("{'a'[:1}") == false);
}

#[test]
fn nested_object_right_bracket_before_key()
{
    assert(can_parse_as_nested("{]'a':1}") == false);
}

#[test]
fn nested_object_right_bracket_after_key()
{
    assert(can_parse_as_nested("{'a']:1}") == false);
}

#[test]
fn nested_object_leading_comma()
{
    assert(can_parse_as_nested("{,'a':1}") == false);
}

#[test]
fn nested_object_comma_after_key()
{
    assert(can_parse_as_nested("{'a',:1}") == false);
}

#[test]
fn nested_object_comma_after_colon()
{
    assert(can_parse_as_nested("{'a':,1}") == false);
}

#[test]
fn nested_object_trailing_comma()
{
    assert(can_parse_as_nested("{'a':1,}") == false);
}

#[test]
fn nested_object_one_comma_minus()
{
    assert(can_parse_as_nested("{'a':1,-}") == false);
}

#[test]
fn nested_object_empty_key_second_key()
{
    assert(can_parse_as_nested("{'a':1,''}") == false);
}

#[test]
fn nested_object_missing_colon_second_key()
{
    assert(can_parse_as_nested("{'a':1,'b'}") == false);
}

#[test]
fn nested_object_missing_value_second_key()
{
    assert(can_parse_as_nested("{'a':1,'b':}") == false);
}

#[test]
fn nested_object_faulty_minus_second_key()
{
    assert(can_parse_as_nested("{'a':1,'b':-}") == false);
}

#[test]
unconstrained
fn nested_object_empty()
{
    assert(JSON::parse("{'a':{'b':{}}}").get_object("a").get_object("b").is_empty() == true);
}

#[test]
unconstrained
fn nested_object_single_character_key_with_value()
{
    assert(JSON::parse("{'a':{'b':{'c':1}}}").get_object("a").get_object("b").get("c").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_multi_character_key_with_value()
{
    assert(JSON::parse("{'a':{'b':{'abc':1}}}").get_object("a").get_object("b").get("abc").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_colon()
{
    assert(JSON::parse("{'a':{'b':{'c:':1}}}").get_object("a").get_object("b").get("c:").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_space()
{
    assert(JSON::parse("{'a':{'b':{'c ':1}}}").get_object("a").get_object("b").get("c ").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_right_brace()
{
    assert(JSON::parse("{'a':{'b':{'c}':1}}}").get_object("a").get_object("b").get("c}").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_left_brace()
{
    assert(JSON::parse("{'a':{'b':{'c{':1}}}").get_object("a").get_object("b").get("c{").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_right_bracket()
{
    assert(JSON::parse("{'a':{'b':{'c]':1}}}").get_object("a").get_object("b").get("c]").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_key_with_left_bracket()
{
    assert(JSON::parse("{'a':{'b':{'c[':1}}}").get_object("a").get_object("b").get("c[").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object_two_keys()
{
    let json = JSON::parse("{'a':{'b':{'abc':1}},'c':{'d':{'abc':2}}}");

    assert(json.doc.len() == 2);
    assert(json.children.len() == 4);

    assert(json.child(1).get("abc").eq_string("1") == true);
    assert(json.child(3).get("abc").eq_string("2") == true);
}

// TODO: fix this
#[test]
unconstrained
fn nested_object_two_keys_same_name_replace_property()
{
    let json = JSON::parse("{'a':{'b':{'abc':1}},'a':{'c':{'def':2}}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 4); // TODO: 1

    assert(json.get_object("a").get_object("c").get("def").eq_string("2") == true);
}

#[test]
unconstrained
fn nested_object_three_keys_unique_values()
{
    let json = JSON::parse("{'a':{'b':{'name':'John Doe','age':30,'isEmployed':true}}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    let object = json.get_object("a").get_object("b");

    assert(object.doc.len() == 3);
    assert(object.get("name").eq_string("'John Doe'") == true);
    assert(object.get("age").eq_string("30") == true);
    assert(object.get("isEmployed").eq_string("true") == true);
}
