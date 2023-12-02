use dep::rontosoft::JSON;

use crate::utils::can_parse_as_value;

#[test]
fn value_escaped_tab()
{
    assert(can_parse_as_value("\t") == false);
}

#[test]
fn value_escaped_newline()
{
    assert(can_parse_as_value("\n") == false);
}

#[test]
fn value_escaped_carriage_return()
{
    assert(can_parse_as_value("\r") == false);
}

#[test]
fn value_escaped_byte_null()
{
    assert(can_parse_as_value("\0") == false);
}

#[test]
unconstrained
fn value_empty_object_with_trailing_null()
{
    assert(JSON::parse("{}\0").is_empty() == true);
}

#[test]
fn value_empty_object_with_trailing_nulls()
{
    assert(can_parse_as_value("{}\0\0") == false);
}

#[test]
fn value_empty_object_with_leading_null()
{
    assert(can_parse_as_value("\0{}") == false);
}

#[test]
fn value_empty_object_with_null_misplaced()
{
    assert(can_parse_as_value("{\0}") == false);
}

#[test]
fn value_string_with_escaped_quotation_mark_left()
{
    assert(can_parse_as_value(r#""\"string""#) == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_right()
{
    assert(can_parse_as_value(r#""string\"""#) == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_middle()
{
    assert(can_parse_as_value(r#""str\"ing""#) == true);
}

#[test]
fn value_string_with_escaped_quotation_mark_both()
{
    assert(can_parse_as_value(r#""\"string\"""#) == true);
}
