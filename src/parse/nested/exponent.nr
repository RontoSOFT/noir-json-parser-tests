use crate::utils::can_parse_as_nested;

#[test]
fn nested_exponent_zero_e_zero()
{
    assert(can_parse_as_nested("0e0") == true);
}

#[test]
fn nested_exponent_zero_E_zero()
{
    assert(can_parse_as_nested("0E0") == true);
}

#[test]
fn nested_exponent_zero_e_plus_zero()
{
    assert(can_parse_as_nested("0e+0") == true);
}

#[test]
fn nested_exponent_zero_e_minus_zero()
{
    assert(can_parse_as_nested("0e-0") == true);
}

#[test]
fn nested_exponent_minus_zero_e_minus_zero()
{
    assert(can_parse_as_nested("-0e-0") == true);
}

#[test]
fn nested_exponent_minus_zero_e_plus_zero()
{
    assert(can_parse_as_nested("-0e+0") == true);
}

#[test]
fn nested_exponent_zero_point_zero_e_zero_plus_zero()
{
    assert(can_parse_as_nested("0.0e+0") == true);
}

#[test]
fn nested_exponent_zero_point_zero_e_zero_minus_zero()
{
    assert(can_parse_as_nested("0.0e-0") == true);
}

#[test]
fn nested_exponent_minus_zero_point_zero_e_zero_minus_zero()
{
    assert(can_parse_as_nested("-0.0e-0") == true);
}

#[test]
fn nested_exponent_minus_zero_point_zero_e_zero_plus_zero()
{
    assert(can_parse_as_nested("-0.0e+0") == true);
}

#[test]
fn value_exponent_zero_e_zero_dot_zero()
{
    assert(can_parse_as_nested("0e0.0") == false);
}

#[test]
fn nested_exponent_plus_zero_e_plus_zero()
{
    assert(can_parse_as_nested("+0e+0") == false);
}

#[test]
fn nested_exponent_plus_zero_e_minus_zero()
{
    assert(can_parse_as_nested("+0e-0") == false);
}

#[test]
fn nested_exponent_plus_zero_point_zero_e_plus_zero()
{
    assert(can_parse_as_nested("+0.0e+0") == false);
}

#[test]
fn nested_exponent_plus_zero_point_zero_e_minus_zero()
{
    assert(can_parse_as_nested("+0.0e-0") == false);
}

#[test]
fn nested_exponent_zero_point_zero_e_letter()
{
    assert(can_parse_as_nested("0.0ef") == false);
}

#[test]
fn nested_exponent_zero_plus_zero_e_zero()
{
    assert(can_parse_as_nested("0+e0") == false);
}

#[test]
fn nested_exponent_zero_plus_zero_E_zero()
{
    assert(can_parse_as_nested("0+E0") == false);
}

#[test]
fn nested_exponent_minus_zero_e_minus_minus_zero()
{
    assert(can_parse_as_nested("-0e--0") == false);
}

#[test]
fn nested_exponent_zero_point_zero_e_zero_plus_plus_zero()
{
    assert(can_parse_as_nested("0.0e++0") == false);
}

#[test]
fn nested_exponent_e()
{
    assert(can_parse_as_nested("e") == false);
}

#[test]
fn nested_exponent_dot_e()
{
    assert(can_parse_as_nested(".e") == false);
}

#[test]
fn nested_exponent_minus_e()
{
    assert(can_parse_as_nested("-e") == false);
}

#[test]
fn nested_exponent_plus_e()
{
    assert(can_parse_as_nested("+e") == false);
}

#[test]
fn nested_exponent_e_minus()
{
    assert(can_parse_as_nested("e-") == false);
}

#[test]
fn nested_exponent_e_plus()
{
    assert(can_parse_as_nested("e+") == false);
}

#[test]
fn nested_exponent_e_minus_zero()
{
    assert(can_parse_as_nested("e-0") == false);
}

#[test]
fn nested_exponent_e_plus_zero()
{
    assert(can_parse_as_nested("e+0") == false);
}

#[test]
fn nested_exponent_minus_dot_e()
{
    assert(can_parse_as_nested("-.e") == false);
}

#[test]
fn nested_exponent_plus_dot_e()
{
    assert(can_parse_as_nested("+.e") == false);
}

#[test]
fn nested_exponent_one_e()
{
    assert(can_parse_as_nested("1e") == false);
}

#[test]
fn nested_exponent_one_e_minus()
{
    assert(can_parse_as_nested("1e-") == false);
}

#[test]
fn nested_exponent_one_e_plus()
{
    assert(can_parse_as_nested("1e+") == false);
}

#[test]
fn nested_exponent_one_point_e()
{
    assert(can_parse_as_nested("1.e") == false);
}

#[test]
fn nested_exponent_one_point_e_minus()
{
    assert(can_parse_as_nested("1.e-") == false);
}

#[test]
fn nested_exponent_one_point_e_plus()
{
    assert(can_parse_as_nested("1.e+") == false);
}

#[test]
fn nested_exponent_one_point_zero_e()
{
    assert(can_parse_as_nested("1.0e") == false);
}

#[test]
fn nested_exponent_one_point_zero_e_minus()
{
    assert(can_parse_as_nested("1.0e-") == false);
}

#[test]
fn nested_exponent_one_point_zero_e_plus()
{
    assert(can_parse_as_nested("1.0e+") == false);
}

#[test]
fn nested_exponent_minus_one_point_zero_e_plus()
{
    assert(can_parse_as_nested("-1.0e+") == false);
}

#[test]
fn nested_exponent_minus_one_point_zero_e_minus()
{
    assert(can_parse_as_nested("-1.0e-") == false);
}

#[test]
fn nested_exponent_zero_e_zero_point_zero_e_zero()
{
    assert(can_parse_as_nested("0e0.0e0") == false);
}

#[test]
fn nested_exponent_zero_e_plus()
{
    assert(can_parse_as_nested("0e+") == false);
}

#[test]
fn nested_exponent_zero_e_minus()
{
    assert(can_parse_as_nested("0e-") == false);
}

#[test]
fn nested_exponent_zero_e_zero_one()
{
    assert(can_parse_as_nested("0e01") == true);
}

#[test]
fn nested_exponent_zero_e_zero_zero_one()
{
    assert(can_parse_as_nested("0e001") == true);
}

#[test]
fn nested_exponent_zero_e_one_zero()
{
    assert(can_parse_as_nested("0e10") == true);
}

#[test]
fn nested_exponent_zero_e_one_zero_one()
{
    assert(can_parse_as_nested("0e101") == true);
}

#[test]
fn nested_exponent_one_e_plus_zero()
{
    assert(can_parse_as_nested("1e+0") == true);
}

#[test]
fn nested_exponent_one_e_minus_zero()
{
    assert(can_parse_as_nested("1e-0") == true);
}

#[test]
fn nested_exponent_one_zero_e_plus_zero()
{
    assert(can_parse_as_nested("10e+0") == true);
}

#[test]
fn nested_exponent_one_zero_e_minus_zero()
{
    assert(can_parse_as_nested("10e-0") == true);
}

#[test]
fn nested_exponent_one_zero_zero_e_plus_zero()
{
    assert(can_parse_as_nested("100e+0") == true);
}

#[test]
fn nested_exponent_one_zero_zero_e_minus_zero()
{
    assert(can_parse_as_nested("100e-0") == true);
}

#[test]
fn nested_exponent_one_zero_zero_one_e_plus_zero()
{
    assert(can_parse_as_nested("1001e+0") == true);
}

#[test]
fn nested_exponent_one_zero_zero_one_e_minus_zero()
{
    assert(can_parse_as_nested("1001e-0") == true);
}

#[test]
fn nested_exponent_one_zero_zero_e_plus_zero_one()
{
    assert(can_parse_as_nested("100e+01") == true);
}

#[test]
fn nested_exponent_one_zero_zero_e_minus_zero_one()
{
    assert(can_parse_as_nested("100e-01") == true);
}

#[test]
fn nested_exponent_one_zero_one_e_plus_one_zero_one()
{
    assert(can_parse_as_nested("101e+101") == true);
}

#[test]
fn nested_exponent_one_zero_one_e_minus_one_zero_one()
{
    assert(can_parse_as_nested("101e-101") == true);
}
