use crate::utils::can_parse_as_nested;

#[test]
fn nested_number_zero()
{
    assert(can_parse_as_nested("0") == true);
}

#[test]
fn nested_number_one()
{
    assert(can_parse_as_nested("1") == true);
}

#[test]
fn nested_number_one_zero_zero()
{
    assert(can_parse_as_nested("100") == true);
}

#[test]
fn nested_number_one_zero_zero_one()
{
    assert(can_parse_as_nested("1001") == true);
}

#[test]
fn nested_number_multiple_one_two_three_four_five()
{
    assert(can_parse_as_nested("12345") == true);
}

#[test]
fn nested_number_minus()
{
    assert(can_parse_as_nested("-") == false);
}

#[test]
fn nested_number_minus_zero()
{
    assert(can_parse_as_nested("-0") == true);
}

#[test]
fn nested_number_minus_one()
{
    assert(can_parse_as_nested("-1") == true);
}

#[test]
fn nested_number_minus_one_zero_zero()
{
    assert(can_parse_as_nested("-100") == true);
}

#[test]
fn nested_number_minus_one_zero_zero_one()
{
    assert(can_parse_as_nested("-1001") == true);
}

#[test]
fn nested_number_minus_one_two_three_four_five()
{
    assert(can_parse_as_nested("-12345") == true);
}

#[test]
fn nested_number_plus()
{
    assert(can_parse_as_nested("+") == false);
}

#[test]
fn nested_number_plus_zero()
{
    assert(can_parse_as_nested("+0") == false);
}

#[test]
fn nested_number_plus_one()
{
    assert(can_parse_as_nested("+1") == false);
}

#[test]
fn nested_number_plus_one_two_three_four_five()
{
    assert(can_parse_as_nested("+12345") == false);
}

#[test]
fn nested_number_double_zero()
{
    assert(can_parse_as_nested("00") == false);
}

#[test]
fn nested_number_leading_zero_one()
{
    assert(can_parse_as_nested("01") == false);
}

#[test]
fn nested_number_zero_zero_one()
{
    assert(can_parse_as_nested("001") == false);
}

#[test]
fn nested_number_zero_one_two_three_four_five()
{
    assert(can_parse_as_nested("012345") == false);
}

#[test]
fn nested_double_minus_zero()
{
    assert(can_parse_as_nested("--0") == false);
}

#[test]
fn nested_double_minus_one()
{
    assert(can_parse_as_nested("--1") == false);
}

#[test]
fn nested_number_zero_minus()
{
    assert(can_parse_as_nested("0-") == false);
}

#[test]
fn nested_number_one_minus()
{
    assert(can_parse_as_nested("1-") == false);
}

#[test]
fn nested_number_minus_zero_minus()
{
    assert(can_parse_as_nested("-0-") == false);
}

#[test]
fn nested_number_minus_one_minus()
{
    assert(can_parse_as_nested("-1-") == false);
}

#[test]
fn nested_number_zero_minus_zero()
{
    assert(can_parse_as_nested("0-0") == false);
}

#[test]
fn nested_number_one_minus_one()
{
    assert(can_parse_as_nested("1-1") == false);
}

#[test]
fn nested_number_minus_zero_minus_zero()
{
    assert(can_parse_as_nested("-0-0") == false);
}

#[test]
fn nested_number_minus_one_minus_one()
{
    assert(can_parse_as_nested("-1-1") == false);
}

#[test]
fn nested_number_one_colon()
{
    assert(can_parse_as_nested("1:") == false);
}

#[test]
fn nested_number_one_quote()
{
    assert(can_parse_as_nested("1\"") == false);
}

#[test]
fn nested_number_one_left_brace()
{
    assert(can_parse_as_nested("1{") == false);
}

#[test]
fn nested_number_one_right_brace()
{
    assert(can_parse_as_nested("1}") == false);
}

#[test]
fn nested_number_one_left_bracket()
{
    assert(can_parse_as_nested("1[") == false);
}

#[test]
fn nested_number_one_right_bracket()
{
    assert(can_parse_as_nested("1]") == false);
}

#[test]
fn nested_number_one_letter()
{
    assert(can_parse_as_nested("1x") == false);
}

#[test]
fn nested_number_one_literal_letter()
{
    assert(can_parse_as_nested("1f") == false);
}

#[test]
fn nested_number_one_space_two()
{
    assert(can_parse_as_nested("1 2") == false);
}

#[test]
fn nested_number_one_comma_two()
{
    assert(can_parse_as_nested("1,2") == false);
}
