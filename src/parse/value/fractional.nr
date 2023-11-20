use crate::utils::can_parse_as_value;

#[test]
fn value_fraction_zero_point_zero()
{
    assert(can_parse_as_value("0.0") == true);
}

#[test]
fn value_fraction_zero_point_single_digits()
{
    assert(can_parse_as_value("0.1") == true);
}

#[test]
fn value_fraction_zero_point_multiple_digits()
{
    assert(can_parse_as_value("0.12345") == true);
}

#[test]
fn value_fraction_minus_zero_point_multiple_digits()
{
    assert(can_parse_as_value("-0.12345") == true);
}

#[test]
fn value_fraction_single_digit_point_zero()
{
    assert(can_parse_as_value("1.0") == true);
}

#[test]
fn value_fraction_minus_single_digit_point_zero()
{
    assert(can_parse_as_value("-1.0") == true);
}

#[test]
fn value_fraction_single_digit_point_single_digit()
{
    assert(can_parse_as_value("1.2") == true);
}

#[test]
fn value_fraction_minus_single_digit_point_single_digit()
{
    assert(can_parse_as_value("-1.2") == true);
}

#[test]
fn value_fraction_single_digit_point_multiple_digits()
{
    assert(can_parse_as_value("1.23456") == true);
}

#[test]
fn value_fraction_minus_single_digit_point_multiple_digits()
{
    assert(can_parse_as_value("-1.23456") == true);
}

#[test]
fn value_fraction_multiple_digits_point_zero()
{
    assert(can_parse_as_value("12345.0") == true);
}

#[test]
fn value_fraction_minus_multiple_digits_point_zero()
{
    assert(can_parse_as_value("-12345.0") == true);
}

#[test]
fn value_fraction_multiple_digits_point_single_digit()
{
    assert(can_parse_as_value("12345.6") == true);
}

#[test]
fn value_fraction_minus_multiple_digits_point_single_digit()
{
    assert(can_parse_as_value("-12345.6") == true);
}

#[test]
fn value_fraction_multiple_digits_point_multiple_digits()
{
    assert(can_parse_as_value("12345.67890") == true);
}

#[test]
fn value_fraction_minus_multiple_digits_point_multiple_digits()
{
    assert(can_parse_as_value("-12345.67890") == true);
}

#[test]
fn value_fraction_zero_point_zero_letter()
{
    assert(can_parse_as_value("0.0f") == false);
}

#[test]
fn value_minus_fraction_one_point_minus_zero()
{
    assert(can_parse_as_value("-1.-0") == false);
}

#[test]
fn value_fraction_one_point_minus_zero()
{
    assert(can_parse_as_value("1.-0") == false);
}

#[test]
fn value_fraction_zero_point_point_zero()
{
    assert(can_parse_as_value("0..0") == false);
}

#[test]
fn value_fraction_zero_point()
{
    assert(can_parse_as_value("0.") == false);
}

#[test]
fn value_fraction_point_zero()
{
    assert(can_parse_as_value(".0") == false);
}

#[test]
fn value_fraction_minus_point()
{
    assert(can_parse_as_value("-.") == false);
}

#[test]
fn value_fraction_point_minus()
{
    assert(can_parse_as_value(".-") == false);
}

#[test]
fn value_fraction_plus_point()
{
    assert(can_parse_as_value("+.") == false);
}

#[test]
fn value_point_plus()
{
    assert(can_parse_as_value(".+") == false);
}
