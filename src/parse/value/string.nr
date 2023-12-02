use crate::utils::can_parse_as_value;

#[test]
fn empty()
{
    assert(can_parse_as_value("\"\"") == true);
}

#[test]
fn one_quote()
{
    assert(can_parse_as_value("\"") == false);
}

#[test]
fn one_quote_and_characters()
{
    assert(can_parse_as_value("\"ab") == false);
}

#[test]
fn number_zero()
{
    assert(can_parse_as_value("\"0\"") == true);
}

#[test]
fn number_multiple_zero()
{
    assert(can_parse_as_value("\"000\"") == true);
}

#[test]
fn minus_and_plus_number_multiple_zero()
{
    assert(can_parse_as_value("\"-+000\"") == true);
}

#[test]
fn number_multiple_digits()
{
    assert(can_parse_as_value("\"12345\"") == true);
}

#[test]
fn string_abc()
{
    assert(can_parse_as_value("\"abc\"") == true);
}

#[test]
fn space_string()
{
    assert(can_parse_as_value(r#""abc" "abc""#) == false);
}

#[test]
fn comma_string()
{
    assert(can_parse_as_value(r#""abc","abc""#) == false);
}

#[test]
fn literal_null()
{
    assert(can_parse_as_value("\"null\"") == true);
}

#[test]
fn literal_true()
{
    assert(can_parse_as_value("\"true\"") == true);
}

#[test]
fn literal_false()
{
    assert(can_parse_as_value("\"false\"") == true);
}

#[test]
fn value_right_brace()
{
    assert(can_parse_as_value("\"5}\"") == true);
}

#[test]
fn value_left_brace()
{
    assert(can_parse_as_value("\"5{\"") == true);
}

#[test]
fn value_right_bracket()
{
    assert(can_parse_as_value("\"5]\"") == true);
}

#[test]
fn value_left_bracket()
{
    assert(can_parse_as_value("\"5[\"") == true);
}
