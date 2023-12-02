use crate::utils::can_parse_as_nested;

#[test]
fn zero_point_zero()
{
    assert(can_parse_as_nested("0.0") == true);
}

#[test]
fn zero_point_single_digits()
{
    assert(can_parse_as_nested("0.1") == true);
}

#[test]
fn zero_point_multiple_digits()
{
    assert(can_parse_as_nested("0.12345") == true);
}

#[test]
fn minus_zero_point_multiple_digits()
{
    assert(can_parse_as_nested("-0.12345") == true);
}

#[test]
fn single_digit_point_zero()
{
    assert(can_parse_as_nested("1.0") == true);
}

#[test]
fn minus_single_digit_point_zero()
{
    assert(can_parse_as_nested("-1.0") == true);
}

#[test]
fn single_digit_point_zero_e_zero()
{
    assert(can_parse_as_nested("1.0e0") == true);
}

#[test]
fn single_digit_point_zero_e_plus_zero()
{
    assert(can_parse_as_nested("1.0e+0") == true);
}

#[test]
fn single_digit_point_zero_e_minus_zero()
{
    assert(can_parse_as_nested("1.0e-0") == true);
}


#[test]
fn single_digit_point_single_digit()
{
    assert(can_parse_as_nested("1.2") == true);
}

#[test]
fn minus_single_digit_point_single_digit()
{
    assert(can_parse_as_nested("-1.2") == true);
}

#[test]
fn single_digit_point_multiple_digits()
{
    assert(can_parse_as_nested("1.23456") == true);
}

#[test]
fn minus_single_digit_point_multiple_digits()
{
    assert(can_parse_as_nested("-1.23456") == true);
}

#[test]
fn multiple_digits_point_zero()
{
    assert(can_parse_as_nested("12345.0") == true);
}

#[test]
fn minus_multiple_digits_point_zero()
{
    assert(can_parse_as_nested("-12345.0") == true);
}

#[test]
fn multiple_digits_point_single_digit()
{
    assert(can_parse_as_nested("12345.6") == true);
}

#[test]
fn minus_multiple_digits_point_single_digit()
{
    assert(can_parse_as_nested("-12345.6") == true);
}

#[test]
fn multiple_digits_point_multiple_digits()
{
    assert(can_parse_as_nested("12345.67890") == true);
}

#[test]
fn minus_multiple_digits_point_multiple_digits()
{
    assert(can_parse_as_nested("-12345.67890") == true);
}

#[test]
fn zero_point_zero_letter()
{
    assert(can_parse_as_nested("0.0f") == false);
}

#[test]
fn nested_minus_fraction_one_point_minus_zero()
{
    assert(can_parse_as_nested("-1.-0") == false);
}

#[test]
fn one_point_minus_zero()
{
    assert(can_parse_as_nested("1.-0") == false);
}

#[test]
fn zero_point_point_zero()
{
    assert(can_parse_as_nested("0..0") == false);
}

#[test]
fn zero_point()
{
    assert(can_parse_as_nested("0.") == false);
}

#[test]
fn point_zero()
{
    assert(can_parse_as_nested(".0") == false);
}

#[test]
fn minus_point()
{
    assert(can_parse_as_nested("-.") == false);
}

#[test]
fn point_minus()
{
    assert(can_parse_as_nested(".-") == false);
}

#[test]
fn plus_point()
{
    assert(can_parse_as_nested("+.") == false);
}

#[test]
fn point_plus()
{
    assert(can_parse_as_nested(".+") == false);
}
