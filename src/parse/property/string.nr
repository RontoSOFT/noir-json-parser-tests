use crate::utils::can_parse_as_property;

#[test]
fn property_string_empty()
{
    assert(can_parse_as_property("''") == true);
}

#[test]
fn property_string_one_quote()
{
    assert(can_parse_as_property("'") == false);
}

#[test]
fn property_string_one_quote_and_characters()
{
    assert(can_parse_as_property("'ab") == false);
}

#[test]
fn property_string_number_zero()
{
    assert(can_parse_as_property("'0'") == true);
}

#[test]
fn property_string_number_multiple_zero()
{
    assert(can_parse_as_property("'000'") == true);
}

#[test]
fn property_string_minus_and_plus_number_multiple_zero()
{
    assert(can_parse_as_property("'-+000'") == true);
}

#[test]
fn property_string_number_multiple_digits()
{
    assert(can_parse_as_property("'12345'") == true);
}

#[test]
fn property_string()
{
    assert(can_parse_as_property("'abc'") == true);
}

#[test]
fn property_string_space_string()
{
    assert(can_parse_as_property("'abc' 'abc'") == false);
}

#[test]
fn property_string_comma_string()
{
    assert(can_parse_as_property("'abc','abc'") == false);
}

#[test]
fn property_string_null()
{
    assert(can_parse_as_property("'null'") == true);
}

#[test]
fn property_string_true()
{
    assert(can_parse_as_property("'true'") == true);
}

#[test]
fn property_string_false()
{
    assert(can_parse_as_property("'false'") == true);
}

#[test]
fn property_string_value_right_brace()
{
    assert(can_parse_as_property("'5}'") == true);
}

#[test]
fn property_string_value_left_brace()
{
    assert(can_parse_as_property("'5{'") == true);
}

#[test]
fn property_string_value_right_bracket()
{
    assert(can_parse_as_property("'5]'") == true);
}

#[test]
fn property_string_value_left_bracket()
{
    assert(can_parse_as_property("'5['") == true);
}
