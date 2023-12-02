use crate::utils::can_parse_as_nested;

#[test]
fn empty()
{
    assert(can_parse_as_nested("\"\"") == true);
}

#[test]
fn one_quote()
{
    assert(can_parse_as_nested("\"") == false);
}

#[test]
fn one_quote_and_characters()
{
    assert(can_parse_as_nested("\"ab") == false);
}

#[test]
fn number_zero()
{
    assert(can_parse_as_nested("\"0\"") == true);
}

#[test]
fn number_multiple_zero()
{
    assert(can_parse_as_nested("\"000\"") == true);
}

#[test]
fn minus_and_plus_number_multiple_zero()
{
    assert(can_parse_as_nested("\"-+000\"") == true);
}

#[test]
fn number_multiple_digits()
{
    assert(can_parse_as_nested("\"12345\"") == true);
}

#[test]
fn string_abc()
{
    assert(can_parse_as_nested("\"abc\"") == true);
}

#[test]
fn space_string()
{
    assert(can_parse_as_nested(r#""abc" "abc""#) == false);
}

#[test]
fn comma_string()
{
    assert(can_parse_as_nested(r#""abc","abc""#) == false);
}

#[test]
fn literal_null()
{
    assert(can_parse_as_nested("\"null\"") == true);
}

#[test]
fn literal_true()
{
    assert(can_parse_as_nested("\"true\"") == true);
}

#[test]
fn literal_false()
{
    assert(can_parse_as_nested("\"false\"") == true);
}

#[test]
fn value_right_brace()
{
    assert(can_parse_as_nested("\"5}\"") == true);
}

#[test]
fn value_left_brace()
{
    assert(can_parse_as_nested("\"5{\"") == true);
}

#[test]
fn value_right_bracket()
{
    assert(can_parse_as_nested("\"5]\"") == true);
}

#[test]
fn value_left_bracket()
{
    assert(can_parse_as_nested("\"5[\"") == true);
}
