use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;
use crate::utils::can_parse_as_value;

#[test]
fn value_string_with_escaped_quotation_mark_left()
{
    assert(can_parse_as_value("'\\'string'") == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_right()
{
    assert(can_parse_as_value("'string\\''") == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_middle()
{
    assert(can_parse_as_value("'str\\'ing'") == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_both()
{
    assert(can_parse_as_value("'\\'string\\''") == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_left()
{
    let value = "''";
    assert(JSON::parse("{'\\'a':''}").get("\\'a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_right()
{
    let value = "''";
    assert(JSON::parse("{'a\\'':''}").get("a\\'").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_middle()
{
    let value = "''";
    assert(JSON::parse("{'a\\'b':''}").get("a\\'b").eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_both()
{
    let value = "''";
    assert(JSON::parse("{'\\'a\\'':''}").get("\\'a\\'").eq_string(value) == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_left()
{
    assert(can_parse_as_property("'\\'string'") == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_right()
{
    assert(can_parse_as_property("'string\\''") == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_middle()
{
    assert(can_parse_as_property("'str\\'ing'") == true);
}

#[test]
fn property_string_with_escaped_quotation_mark_both()
{
    assert(can_parse_as_property("'\\'string\\''") == true);
}

#[test]
unconstrained
fn empty_object_with_trailing_null()
{
    assert(JSON::parse("{}\0").is_empty() == true);
}

#[test]
fn empty_object_with_trailing_nulls()
{
    assert(can_parse_as_property("{}\0\0") == false);
}

#[test]
fn empty_object_with_leading_null()
{
    assert(can_parse_as_property("\0{}") == false);
}

#[test]
fn empty_object_with_null_misplaced()
{
    assert(can_parse_as_property("{\0}") == false);
}
