use crate::utils::can_parse_as_value;

#[test]
fn zero_e_zero()
{
    assert(can_parse_as_value("0e0") == true);
}

#[test]
fn zero_E_zero()
{
    assert(can_parse_as_value("0E0") == true);
}

#[test]
fn zero_e_plus_zero()
{
    assert(can_parse_as_value("0e+0") == true);
}

#[test]
fn zero_e_minus_zero()
{
    assert(can_parse_as_value("0e-0") == true);
}

#[test]
fn minus_zero_e_minus_zero()
{
    assert(can_parse_as_value("-0e-0") == true);
}

#[test]
fn minus_zero_e_plus_zero()
{
    assert(can_parse_as_value("-0e+0") == true);
}

#[test]
fn zero_point_zero_e_zero_plus_zero()
{
    assert(can_parse_as_value("0.0e+0") == true);
}

#[test]
fn zero_point_zero_e_zero_minus_zero()
{
    assert(can_parse_as_value("0.0e-0") == true);
}

#[test]
fn minus_zero_point_zero_e_zero_minus_zero()
{
    assert(can_parse_as_value("-0.0e-0") == true);
}

#[test]
fn minus_zero_point_zero_e_zero_plus_zero()
{
    assert(can_parse_as_value("-0.0e+0") == true);
}

#[test]
fn zero_e_zero_dot_zero()
{
    assert(can_parse_as_value("0e0.0") == false);
}

#[test]
fn zero_e_minus_plus_zero()
{
    assert(can_parse_as_value("0e-+0") == false);
}

#[test]
fn zero_e_plus_minus_zero()
{
    assert(can_parse_as_value("0e+-0") == false);
}

#[test]
fn plus_zero_e_plus_zero()
{
    assert(can_parse_as_value("+0e+0") == false);
}

#[test]
fn plus_zero_e_minus_zero()
{
    assert(can_parse_as_value("+0e-0") == false);
}

#[test]
fn plus_zero_point_zero_e_plus_zero()
{
    assert(can_parse_as_value("+0.0e+0") == false);
}

#[test]
fn plus_zero_point_zero_e_minus_zero()
{
    assert(can_parse_as_value("+0.0e-0") == false);
}

#[test]
fn zero_point_zero_e_letter()
{
    assert(can_parse_as_value("0.0ef") == false);
}

#[test]
fn zero_plus_zero_e_zero()
{
    assert(can_parse_as_value("0+e0") == false);
}

#[test]
fn zero_plus_zero_E_zero()
{
    assert(can_parse_as_value("0+E0") == false);
}

#[test]
fn minus_zero_e_minus_minus_zero()
{
    assert(can_parse_as_value("-0e--0") == false);
}

#[test]
fn zero_point_zero_e_zero_plus_plus_zero()
{
    assert(can_parse_as_value("0.0e++0") == false);
}

#[test]
fn e()
{
    assert(can_parse_as_value("e") == false);
}

#[test]
fn dot_e()
{
    assert(can_parse_as_value(".e") == false);
}

#[test]
fn minus_e()
{
    assert(can_parse_as_value("-e") == false);
}

#[test]
fn plus_e()
{
    assert(can_parse_as_value("+e") == false);
}

#[test]
fn e_minus()
{
    assert(can_parse_as_value("e-") == false);
}

#[test]
fn e_plus()
{
    assert(can_parse_as_value("e+") == false);
}

#[test]
fn e_minus_zero()
{
    assert(can_parse_as_value("e-0") == false);
}

#[test]
fn e_plus_zero()
{
    assert(can_parse_as_value("e+0") == false);
}

#[test]
fn minus_dot_e()
{
    assert(can_parse_as_value("-.e") == false);
}

#[test]
fn plus_dot_e()
{
    assert(can_parse_as_value("+.e") == false);
}

#[test]
fn one_e()
{
    assert(can_parse_as_value("1e") == false);
}

#[test]
fn one_e_minus()
{
    assert(can_parse_as_value("1e-") == false);
}

#[test]
fn one_e_plus()
{
    assert(can_parse_as_value("1e+") == false);
}

#[test]
fn one_point_e()
{
    assert(can_parse_as_value("1.e") == false);
}

#[test]
fn one_point_e_minus()
{
    assert(can_parse_as_value("1.e-") == false);
}

#[test]
fn one_point_e_plus()
{
    assert(can_parse_as_value("1.e+") == false);
}

#[test]
fn one_point_zero_e()
{
    assert(can_parse_as_value("1.0e") == false);
}

#[test]
fn one_point_zero_e_minus()
{
    assert(can_parse_as_value("1.0e-") == false);
}

#[test]
fn one_point_zero_e_plus()
{
    assert(can_parse_as_value("1.0e+") == false);
}

#[test]
fn minus_one_point_zero_e_plus()
{
    assert(can_parse_as_value("-1.0e+") == false);
}

#[test]
fn minus_one_point_zero_e_minus()
{
    assert(can_parse_as_value("-1.0e-") == false);
}

#[test]
fn zero_e_zero_point_zero_e_zero()
{
    assert(can_parse_as_value("0e0.0e0") == false);
}

#[test]
fn zero_e_plus()
{
    assert(can_parse_as_value("0e+") == false);
}

#[test]
fn zero_e_minus()
{
    assert(can_parse_as_value("0e-") == false);
}

#[test]
fn zero_e_zero_one()
{
    assert(can_parse_as_value("0e01") == true);
}

#[test]
fn zero_e_zero_zero_one()
{
    assert(can_parse_as_value("0e001") == true);
}

#[test]
fn zero_e_one_zero()
{
    assert(can_parse_as_value("0e10") == true);
}

#[test]
fn zero_e_one_zero_one()
{
    assert(can_parse_as_value("0e101") == true);
}

#[test]
fn one_e_plus_zero()
{
    assert(can_parse_as_value("1e+0") == true);
}

#[test]
fn one_e_minus_zero()
{
    assert(can_parse_as_value("1e-0") == true);
}

#[test]
fn one_zero_e_plus_zero()
{
    assert(can_parse_as_value("10e+0") == true);
}

#[test]
fn one_zero_e_minus_zero()
{
    assert(can_parse_as_value("10e-0") == true);
}

#[test]
fn one_zero_zero_e_plus_zero()
{
    assert(can_parse_as_value("100e+0") == true);
}

#[test]
fn one_zero_zero_e_minus_zero()
{
    assert(can_parse_as_value("100e-0") == true);
}

#[test]
fn one_zero_zero_one_e_plus_zero()
{
    assert(can_parse_as_value("1001e+0") == true);
}

#[test]
fn one_zero_zero_one_e_minus_zero()
{
    assert(can_parse_as_value("1001e-0") == true);
}

#[test]
fn one_zero_zero_e_plus_zero_one()
{
    assert(can_parse_as_value("100e+01") == true);
}

#[test]
fn one_zero_zero_e_minus_zero_one()
{
    assert(can_parse_as_value("100e-01") == true);
}

#[test]
fn one_zero_one_e_plus_one_zero_one()
{
    assert(can_parse_as_value("101e+101") == true);
}

#[test]
fn one_zero_one_e_minus_one_zero_one()
{
    assert(can_parse_as_value("101e-101") == true);
}
