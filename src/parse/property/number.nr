use crate::utils::can_parse_as_property;

#[test]
fn zero()
{
    assert(can_parse_as_property("0") == true);
}

#[test]
fn one()
{
    assert(can_parse_as_property("1") == true);
}

#[test]
fn one_zero_zero()
{
    assert(can_parse_as_property("100") == true);
}

#[test]
fn one_zero_zero_one()
{
    assert(can_parse_as_property("1001") == true);
}

#[test]
fn multiple_one_two_three_four_five()
{
    assert(can_parse_as_property("12345") == true);
}

#[test]
fn minus()
{
    assert(can_parse_as_property("-") == false);
}

#[test]
fn minus_zero()
{
    assert(can_parse_as_property("-0") == true);
}

#[test]
fn minus_one()
{
    assert(can_parse_as_property("-1") == true);
}

#[test]
fn minus_one_zero_zero()
{
    assert(can_parse_as_property("-100") == true);
}

#[test]
fn minus_one_zero_zero_one()
{
    assert(can_parse_as_property("-1001") == true);
}

#[test]
fn minus_one_two_three_four_five()
{
    assert(can_parse_as_property("-12345") == true);
}

#[test]
fn plus()
{
    assert(can_parse_as_property("+") == false);
}

#[test]
fn plus_zero()
{
    assert(can_parse_as_property("+0") == false);
}

#[test]
fn plus_one()
{
    assert(can_parse_as_property("+1") == false);
}

#[test]
fn plus_one_two_three_four_five()
{
    assert(can_parse_as_property("+12345") == false);
}

#[test]
fn double_zero()
{
    assert(can_parse_as_property("00") == false);
}

#[test]
fn leading_zero_one()
{
    assert(can_parse_as_property("01") == false);
}

#[test]
fn zero_zero_one()
{
    assert(can_parse_as_property("001") == false);
}

#[test]
fn zero_one_two_three_four_five()
{
    assert(can_parse_as_property("012345") == false);
}

#[test]
fn property_double_minus_zero()
{
    assert(can_parse_as_property("--0") == false);
}

#[test]
fn property_double_minus_one()
{
    assert(can_parse_as_property("--1") == false);
}

#[test]
fn zero_minus()
{
    assert(can_parse_as_property("0-") == false);
}

#[test]
fn one_minus()
{
    assert(can_parse_as_property("1-") == false);
}

#[test]
fn minus_zero_minus()
{
    assert(can_parse_as_property("-0-") == false);
}

#[test]
fn minus_one_minus()
{
    assert(can_parse_as_property("-1-") == false);
}

#[test]
fn zero_minus_zero()
{
    assert(can_parse_as_property("0-0") == false);
}

#[test]
fn one_minus_one()
{
    assert(can_parse_as_property("1-1") == false);
}

#[test]
fn minus_zero_minus_zero()
{
    assert(can_parse_as_property("-0-0") == false);
}

#[test]
fn minus_one_minus_one()
{
    assert(can_parse_as_property("-1-1") == false);
}

#[test]
fn one_colon()
{
    assert(can_parse_as_property("1:") == false);
}

#[test]
fn one_quote()
{
    assert(can_parse_as_property("1\"") == false);
}

#[test]
fn one_left_brace()
{
    assert(can_parse_as_property("1{") == false);
}

#[test]
fn one_right_brace()
{
    assert(can_parse_as_property("1}") == false);
}

#[test]
fn one_left_bracket()
{
    assert(can_parse_as_property("1[") == false);
}

#[test]
fn one_right_bracket()
{
    assert(can_parse_as_property("1]") == false);
}

#[test]
fn one_letter()
{
    assert(can_parse_as_property("1x") == false);
}

#[test]
fn one_literal_letter()
{
    assert(can_parse_as_property("1f") == false);
}

#[test]
fn one_space_two()
{
    assert(can_parse_as_property("1 2") == false);
}

#[test]
fn one_comma_two()
{
    assert(can_parse_as_property("1,2") == false);
}
