use crate::utils::can_parse_as_value;

#[test]
fn value_string_empty()
{
    assert(can_parse_as_value("''") == true);
}

#[test]
fn value_string_one_quote()
{
    assert(can_parse_as_value("'") == false);
}

#[test]
fn value_string_one_quote_and_characters()
{
    assert(can_parse_as_value("'ab") == false);
}

#[test]
fn value_string_number_zero()
{
    assert(can_parse_as_value("'0'") == true);
}

#[test]
fn value_string_number_multiple_zero()
{
    assert(can_parse_as_value("'000'") == true);
}

#[test]
fn value_string_minus_and_plus_number_multiple_zero()
{
    assert(can_parse_as_value("'-+000'") == true);
}

#[test]
fn value_string_number_multiple_digits()
{
    assert(can_parse_as_value("'12345'") == true);
}

#[test]
fn value_string()
{
    assert(can_parse_as_value("'abc'") == true);
}

#[test]
fn value_string_space_string()
{
    assert(can_parse_as_value("'abc' 'abc'") == false);
}

#[test]
fn value_string_comma_string()
{
    assert(can_parse_as_value("'abc','abc'") == false);
}

#[test]
fn value_string_null()
{
    assert(can_parse_as_value("'null'") == true);
}

#[test]
fn value_string_true()
{
    assert(can_parse_as_value("'true'") == true);
}

#[test]
fn value_string_false()
{
    assert(can_parse_as_value("'false'") == true);
}

#[test]
fn value_string_value_right_brace()
{
    assert(can_parse_as_value("'5}'") == true);
}

#[test]
fn value_string_value_left_brace()
{
    assert(can_parse_as_value("'5{'") == true);
}

#[test]
fn value_string_value_right_bracket()
{
    assert(can_parse_as_value("'5]'") == true);
}

#[test]
fn value_string_value_left_bracket()
{
    assert(can_parse_as_value("'5['") == true);
}
