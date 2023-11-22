use crate::utils::can_parse_as_nested;

#[test]
fn nested_string_empty()
{
    assert(can_parse_as_nested("''") == true);
}

#[test]
fn nested_string_one_quote()
{
    assert(can_parse_as_nested("'") == false);
}

#[test]
fn nested_string_one_quote_and_characters()
{
    assert(can_parse_as_nested("'ab") == false);
}

#[test]
fn nested_string_number_zero()
{
    assert(can_parse_as_nested("'0'") == true);
}

#[test]
fn nested_string_number_multiple_zero()
{
    assert(can_parse_as_nested("'000'") == true);
}

#[test]
fn nested_string_minus_and_plus_number_multiple_zero()
{
    assert(can_parse_as_nested("'-+000'") == true);
}

#[test]
fn nested_string_number_multiple_digits()
{
    assert(can_parse_as_nested("'12345'") == true);
}

#[test]
fn nested_string()
{
    assert(can_parse_as_nested("'abc'") == true);
}

#[test]
fn nested_string_space_string()
{
    assert(can_parse_as_nested("'abc' 'abc'") == false);
}

#[test]
fn nested_string_comma_string()
{
    assert(can_parse_as_nested("'abc','abc'") == false);
}

#[test]
fn nested_string_null()
{
    assert(can_parse_as_nested("'null'") == true);
}

#[test]
fn nested_string_true()
{
    assert(can_parse_as_nested("'true'") == true);
}

#[test]
fn nested_string_false()
{
    assert(can_parse_as_nested("'false'") == true);
}

#[test]
fn nested_string_value_right_brace()
{
    assert(can_parse_as_nested("'5}'") == true);
}

#[test]
fn nested_string_value_left_brace()
{
    assert(can_parse_as_nested("'5{'") == true);
}

#[test]
fn nested_string_value_right_bracket()
{
    assert(can_parse_as_nested("'5]'") == true);
}

#[test]
fn nested_string_value_left_bracket()
{
    assert(can_parse_as_nested("'5['") == true);
}
