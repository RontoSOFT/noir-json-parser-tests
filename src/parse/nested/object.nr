use dep::rontosoft::JSON;

use crate::utils::can_parse_as_nested;

#[test]
fn property_object_left_brace()
{
    assert(can_parse_as_nested("{") == false);
}

#[test]
fn property_object_right_brace()
{
    assert(can_parse_as_nested("}") == false);
}

#[test]
fn property_object_quote_left_brace()
{
    assert(can_parse_as_nested("'{") == false);
}

#[test]
fn property_object_right_brace_quote()
{
    assert(can_parse_as_nested("}'") == false);
}

#[test]
fn property_object_empty_colon()
{
    assert(can_parse_as_nested("{:}") == false);
}

#[test]
fn property_object_empty_comma()
{
    assert(can_parse_as_nested("{'b':{,}}") == false);
}

#[test]
fn property_object_empty_key()
{
    assert(can_parse_as_nested("{''}") == false);
}

#[test]
fn property_object_empty_key_with_colon()
{
    assert(can_parse_as_nested("{'':}") == false);
}

#[test]
fn property_object_key_with_colon_missing_value()
{
    assert(can_parse_as_nested("{'b':}") == false);
}

#[test]
fn property_object_missing_key_with_value()
{
    assert(can_parse_as_nested("{:1}") == false);
}

#[test]
fn property_object_empty_key_with_value()
{
    assert(can_parse_as_nested("{'':1}") == false);
}

#[test]
fn property_object_faulty_colon()
{
    assert(can_parse_as_nested("{:'b':1}") == false);
}

#[test]
fn property_object_quote_before_key()
{
    assert(can_parse_as_nested("{''b':1}") == false);
}

#[test]
fn property_object_quote_after_key()
{
    assert(can_parse_as_nested("{'b'':1}") == false);
}

#[test]
fn property_object_left_brace_before_key()
{
    assert(can_parse_as_nested("{{'b':1}") == false);
}

#[test]
fn property_object_left_brace_after_key()
{
    assert(can_parse_as_nested("{'b'{:1}") == false);
}

#[test]
fn property_object_right_brace_before_key()
{
    assert(can_parse_as_nested("{}'b':1}") == false);
}

#[test]
fn property_object_right_brace_after_key()
{
    assert(can_parse_as_nested("{'b'}:1}") == false);
}

#[test]
fn property_object_left_bracket_before_key()
{
    assert(can_parse_as_nested("{['b':1}") == false);
}

#[test]
fn property_object_left_bracket_after_key()
{
    assert(can_parse_as_nested("{'b'[:1}") == false);
}

#[test]
fn property_object_right_bracket_before_key()
{
    assert(can_parse_as_nested("{]'b':1}") == false);
}

#[test]
fn property_object_right_bracket_after_key()
{
    assert(can_parse_as_nested("{'b']:1}") == false);
}

#[test]
fn property_object_leading_comma()
{
    assert(can_parse_as_nested("{,'b':1}") == false);
}

#[test]
fn property_object_comma_after_key()
{
    assert(can_parse_as_nested("{'b',:1}") == false);
}

#[test]
fn property_object_comma_after_colon()
{
    assert(can_parse_as_nested("{'b':,1}") == false);
}

#[test]
fn property_object_trailing_comma()
{
    assert(can_parse_as_nested("{'b':1,}") == false);
}

#[test]
fn property_object_one_comma_minus()
{
    assert(can_parse_as_nested("{'b':1,-}") == false);
}

#[test]
fn property_object_empty_key_second_key()
{
    assert(can_parse_as_nested("{'b':1,''}") == false);
}

#[test]
fn property_object_missing_colon_second_key()
{
    assert(can_parse_as_nested("{'b':1,'c'}") == false);
}

#[test]
fn property_object_missing_value_second_key()
{
    assert(can_parse_as_nested("{'b':1,'c':}") == false);
}

#[test]
fn property_object_faulty_minus_second_key()
{
    assert(can_parse_as_nested("{'b':1,'c':-}") == false);
}

#[test]
unconstrained
fn property_object_empty()
{
    let json = JSON::parse("{'a':{}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn property_object_single_character_key_with_value()
{
    let json = JSON::parse("{'a':{'b':1}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).get("b").eq_string("1") == true);
}

#[test]
unconstrained
fn property_object_multi_character_key_with_value()
{
    let json = JSON::parse("{'abc':{'b':1}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).get("b").eq_string("1") == true);
}
