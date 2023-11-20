use crate::utils::can_parse_as_value;

#[test]
fn value_number_zero()
{
    assert(can_parse_as_value("0") == true);
}

#[test]
fn value_number_one()
{
    assert(can_parse_as_value("1") == true);
}

#[test]
fn value_number_one_zero_zero()
{
    assert(can_parse_as_value("100") == true);
}

#[test]
fn value_number_one_zero_zero_one()
{
    assert(can_parse_as_value("1001") == true);
}

#[test]
fn value_number_multiple_one_two_three_four_five()
{
    assert(can_parse_as_value("12345") == true);
}

#[test]
fn value_number_minus()
{
    assert(can_parse_as_value("-") == false);
}

#[test]
fn value_number_minus_zero()
{
    assert(can_parse_as_value("-0") == true);
}

#[test]
fn value_number_minus_one()
{
    assert(can_parse_as_value("-1") == true);
}

#[test]
fn value_number_minus_one_zero_zero()
{
    assert(can_parse_as_value("-100") == true);
}

#[test]
fn value_number_minus_one_zero_zero_one()
{
    assert(can_parse_as_value("-1001") == true);
}

#[test]
fn value_number_minus_one_two_three_four_five()
{
    assert(can_parse_as_value("-12345") == true);
}

#[test]
fn value_number_plus()
{
    assert(can_parse_as_value("+") == false);
}

#[test]
fn value_number_plus_zero()
{
    assert(can_parse_as_value("+0") == false);
}

#[test]
fn value_number_plus_one()
{
    assert(can_parse_as_value("+1") == false);
}

#[test]
fn value_number_plus_one_two_three_four_five()
{
    assert(can_parse_as_value("+12345") == false);
}

#[test]
fn value_number_double_zero()
{
    assert(can_parse_as_value("00") == false);
}

#[test]
fn value_number_leading_zero_one()
{
    assert(can_parse_as_value("01") == false);
}

#[test]
fn value_number_zero_zero_one()
{
    assert(can_parse_as_value("001") == false);
}

#[test]
fn value_number_zero_one_two_three_four_five()
{
    assert(can_parse_as_value("012345") == false);
}

#[test]
fn value_double_minus_zero()
{
    assert(can_parse_as_value("--0") == false);
}

#[test]
fn value_double_minus_one()
{
    assert(can_parse_as_value("--1") == false);
}

#[test]
fn value_number_zero_minus()
{
    assert(can_parse_as_value("0-") == false);
}

#[test]
fn value_number_one_minus()
{
    assert(can_parse_as_value("1-") == false);
}

#[test]
fn value_number_minus_zero_minus()
{
    assert(can_parse_as_value("-0-") == false);
}

#[test]
fn value_number_minus_one_minus()
{
    assert(can_parse_as_value("-1-") == false);
}

#[test]
fn value_number_zero_minus_zero()
{
    assert(can_parse_as_value("0-0") == false);
}

#[test]
fn value_number_one_minus_one()
{
    assert(can_parse_as_value("1-1") == false);
}

#[test]
fn value_number_minus_zero_minus_zero()
{
    assert(can_parse_as_value("-0-0") == false);
}

#[test]
fn value_number_minus_one_minus_one()
{
    assert(can_parse_as_value("-1-1") == false);
}

#[test]
fn value_number_one_comma()
{
    assert(can_parse_as_value("1,") == false);
}

#[test]
fn value_number_one_comma_space()
{
    assert(can_parse_as_value("1, ") == false);
}

#[test]
fn value_number_one_colon()
{
    assert(can_parse_as_value("1:") == false);
}

#[test]
fn value_number_one_quote()
{
    assert(can_parse_as_value("1'") == false);
}

#[test]
fn value_number_one_left_brace()
{
    assert(can_parse_as_value("1{") == false);
}

#[test]
fn value_number_one_right_brace()
{
    assert(can_parse_as_value("1}") == false);
}

#[test]
fn value_number_one_left_bracket()
{
    assert(can_parse_as_value("1[") == false);
}

#[test]
fn value_number_one_right_bracket()
{
    assert(can_parse_as_value("1]") == false);
}

#[test]
fn value_number_one_letter()
{
    assert(can_parse_as_value("1x") == false);
}

#[test]
fn value_number_one_literal_letter()
{
    assert(can_parse_as_value("1f") == false);
}

#[test]
fn value_number_one_space_two()
{
    assert(can_parse_as_value("1 2") == false);
}

#[test]
fn value_number_one_comma_two()
{
    assert(can_parse_as_value("1,2") == false);
}
