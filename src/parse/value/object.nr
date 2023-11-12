use dep::rontosoft::JSON;

use crate::utils::object_one;

#[test]
unconstrained
fn value_object_empty()
{
    assert(JSON::parse("{}").doc.is_none() == true);
}

#[test]
unconstrained
fn value_object_empty_colon()
{
    assert(JSON::parse("{:}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_comma()
{
    assert(JSON::parse("{,}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_key()
{
    assert(JSON::parse("{''}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_key_with_colon()
{
    assert(JSON::parse("{'':}").is_empty());
}

#[test]
unconstrained
fn value_object_key_with_colon_missing_value()
{
    assert(JSON::parse("{'a':}").is_empty());
}

#[test]
unconstrained
fn value_object_missing_key_with_value()
{
    assert(JSON::parse("{:1}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_key_with_value()
{
    assert(JSON::parse("{'':1}").is_empty());
}

#[test]
unconstrained
fn value_object_single_character_key_with_value()
{
    assert(JSON::parse("{'a':1}").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_multi_character_key_with_value()
{
    assert(JSON::parse("{'abc':1}").get("abc").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_single_spaces()
{
    assert(JSON::parse(" { 'a' : 1 } ").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_single_multiple_spaces()
{
    assert(JSON::parse("   {   'a'   :   1   }   ").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_single_random_spaces()
{
    assert(JSON::parse(" {  'a':   1}  ").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_colon()
{
    assert(JSON::parse("{'a:':1}").get("a:").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_space()
{
    assert(JSON::parse("{'a ':1}").get("a ").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_right_brace()
{
    assert(JSON::parse("{'a}':1}").get("a}").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_left_brace()
{
    assert(JSON::parse("{'a{':1}").get("a{").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_right_bracket()
{
    assert(JSON::parse("{'a]':1}").get("a]").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_left_bracket()
{
    assert(JSON::parse("{'a[':1}").get("a[").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_escaped_left_and_right()
{
    assert(JSON::parse("{\\'a\\':1}").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_escaped_left()
{
    assert(JSON::parse("{\\'a':1}").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_key_with_escaped_right()
{
    assert(JSON::parse("{'a\\':1}").get("a").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn value_object_faulty_colon()
{
    assert(JSON::parse("{:'a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_quote_before_key()
{
    assert(JSON::parse("{''a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_quote_after_key()
{
    assert(JSON::parse("{'a'':1}").is_empty());
}

#[test]
unconstrained
fn value_object_left_brace_before_key()
{
    assert(JSON::parse("{{'a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_left_brace_after_key()
{
    assert(JSON::parse("{'a'{:1}").is_empty());
}

#[test]
unconstrained
fn value_object_right_brace_before_key()
{
    assert(JSON::parse("{}'a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_right_brace_after_key()
{
    assert(JSON::parse("{'a'}:1}").is_empty());
}

#[test]
unconstrained
fn value_object_left_bracket_before_key()
{
    assert(JSON::parse("{['a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_left_bracket_after_key()
{
    assert(JSON::parse("{'a'[:1}").is_empty());
}

#[test]
unconstrained
fn value_object_right_bracket_before_key()
{
    assert(JSON::parse("{]'a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_right_bracket_after_key()
{
    assert(JSON::parse("{'a']:1}").is_empty());
}

#[test]
unconstrained
fn value_object_leading_comma()
{
    assert(JSON::parse("{,'a':1}").is_empty());
}

#[test]
unconstrained
fn value_object_comma_after_key()
{
    assert(JSON::parse("{'a',:1}").is_empty());
}

#[test]
unconstrained
fn value_object_comma_after_colon()
{
    assert(JSON::parse("{'a':,1}").is_empty());
}

#[test]
unconstrained
fn value_object_trailing_comma()
{
    assert(JSON::parse("{'a':1,}").is_empty());
}

#[test]
unconstrained
fn value_object_one_comma_minus()
{
    assert(JSON::parse("{'a':1,-}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_key_second_key()
{
    assert(JSON::parse("{'a':1,''}").is_empty());
}

#[test]
unconstrained
fn value_object_missing_colon_second_key()
{
    assert(JSON::parse("{'a':1,'b'}").is_empty());
}

#[test]
unconstrained
fn value_object_missing_value_second_key()
{
    assert(JSON::parse("{'a':1,'b':}").is_empty());
}

#[test]
unconstrained
fn value_object_faulty_minus_second_key()
{
    assert(JSON::parse("{'a':1,'b':-}").is_empty());
}

#[test]
unconstrained
fn value_object_two_keys_number()
{
    let json = JSON::parse("{'a':1,'b':2}");

    assert(json.get("a").unwrap().eq_string("1") == true);
    assert(json.get("b").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn value_object_two_keys_string_and_number()
{
    let json = JSON::parse("{'a':'1','b':2}");

    assert(json.get("a").unwrap().eq_string("'1'") == true);
    assert(json.get("b").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn value_object_two_keys_string_and_string()
{
    let json = JSON::parse("{'a':'1','b':'2'}");

    assert(json.get("a").unwrap().eq_string("'1'") == true);
    assert(json.get("b").unwrap().eq_string("'2'") == true);
}

#[test]
unconstrained
fn value_object_two_keys_same_name_replace_property()
{
    assert(JSON::parse("{'a':1,'a':2}").get("a").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn value_object_three_keys_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}");

    assert(json.doc.len() == 3);

    assert(json.get("name").unwrap().eq_string("'John Doe'") == true);
    assert(json.get("age").unwrap().eq_string("30") == true);
    assert(json.get("isEmployed").unwrap().eq_string("true") == true);
}

#[test]
unconstrained
fn value_object_empty_with_trailing_null()
{
    assert(JSON::parse("{}\0").doc.is_none() == true);
}

#[test]
unconstrained
fn value_object_empty_with_trailing_null_with_space()
{
    assert(JSON::parse("{} \0").doc.is_none() == true);
}

#[test]
unconstrained
fn value_object_empty_with_trailing_null_with_spaces()
{
    assert(JSON::parse("{}   \0").doc.is_none() == true);
}

#[test]
unconstrained
fn value_object_empty_with_trailing_nulls()
{
    assert(JSON::parse("{}\0\0").is_empty());
}

#[test]
unconstrained
fn value_object_empty_with_leading_null()
{
    assert(JSON::parse("\0{}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_with_leading_null_and_space()
{
    assert(JSON::parse(" \0{}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_with_leading_null_and_spaces()
{
    assert(JSON::parse("   \0{}").is_empty());
}

#[test]
unconstrained
fn value_object_empty_with_null_misplaced()
{
    assert(JSON::parse("{\0}").is_empty());
}
