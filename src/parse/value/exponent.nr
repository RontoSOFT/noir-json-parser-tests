use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_exponent_zero_e_zero()
{
    let json = "0e0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_E_zero()
{
    let json = "0E0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_plus_zero()
{
    let json = "0e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_minus_zero()
{
    let json = "0e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_minus_zero_e_minus_zero()
{
    let json = "-0e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_minus_zero_e_plus_zero()
{
    let json = "-0e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_e_zero_plus_zero()
{
    let json = "0.0e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_e_zero_minus_zero()
{
    let json = "0.0e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_minus_zero_point_zero_e_zero_minus_zero()
{
    let json = "-0.0e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_minus_zero_point_zero_e_zero_plus_zero()
{
    let json = "-0.0e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_minus_plus_zero()
{
    assert(JSON::parse("0e-+0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_e_plus_minus_zero()
{
    assert(JSON::parse("0e+-0").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_zero_e_plus_zero()
{
    assert(JSON::parse("+0e+0").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_zero_e_minus_zero()
{
    assert(JSON::parse("+0e-0").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_zero_point_zero_e_plus_zero()
{
    assert(JSON::parse("+0.0e+0").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_zero_point_zero_e_minus_zero()
{
    assert(JSON::parse("+0.0e-0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_e_letter()
{
    assert(JSON::parse("0.0ef").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_e_escaped_zero()
{
    assert(JSON::parse("0.0e\0").is_none());
}

#[test]
unconstrained
fn value_exponent_escaped_zero_point_zero_e_zero()
{
    assert(JSON::parse("\0.0e0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_escaped_e_zero()
{
    assert(JSON::parse("0.0\\e0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_plus_zero_e_zero()
{
    assert(JSON::parse("0+e0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_plus_zero_E_zero()
{
    assert(JSON::parse("0+E0").is_none());
}

#[test]
unconstrained
fn value_exponent_minus_zero_e_minus_minus_zero()
{
    assert(JSON::parse("-0e--0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_point_zero_e_zero_plus_plus_zero()
{
    assert(JSON::parse("0.0e++0").is_none());
}

#[test]
unconstrained
fn value_exponent_e()
{
    assert(JSON::parse("e").is_none());
}

#[test]
unconstrained
fn value_exponent_dot_e()
{
    assert(JSON::parse(".e").is_none());
}

#[test]
unconstrained
fn value_exponent_minus_e()
{
    assert(JSON::parse("-e").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_e()
{
    assert(JSON::parse("+e").is_none());
}

#[test]
unconstrained
fn value_exponent_e_minus()
{
    assert(JSON::parse("e-").is_none());
}

#[test]
unconstrained
fn value_exponent_e_plus()
{
    assert(JSON::parse("e+").is_none());
}

#[test]
unconstrained
fn value_exponent_e_minus_zero()
{
    assert(JSON::parse("e-0").is_none());
}

#[test]
unconstrained
fn value_exponent_e_plus_zero()
{
    assert(JSON::parse("e+0").is_none());
}

#[test]
unconstrained
fn value_exponent_minus_dot_e()
{
    assert(JSON::parse("-.e").is_none());
}

#[test]
unconstrained
fn value_exponent_plus_dot_e()
{
    assert(JSON::parse("+.e").is_none());
}

#[test]
unconstrained
fn value_exponent_one_e()
{
    assert(JSON::parse("1e").is_none());
}

#[test]
unconstrained
fn value_exponent_one_e_minus()
{
    assert(JSON::parse("1e-").is_none());
}

#[test]
unconstrained
fn value_exponent_one_e_plus()
{
    assert(JSON::parse("1e+").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_e()
{
    assert(JSON::parse("1.e").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_e_minus()
{
    assert(JSON::parse("1.e-").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_e_plus()
{
    assert(JSON::parse("1.e+").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_zero_e()
{
    assert(JSON::parse("1.0e").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_zero_e_minus()
{
    assert(JSON::parse("1.0e-").is_none());
}

#[test]
unconstrained
fn value_exponent_one_point_zero_e_plus()
{
    assert(JSON::parse("1.0e+").is_none());
}

#[test]
unconstrained
fn value_exponent_minus_one_point_zero_e_plus()
{
    assert(JSON::parse("-1.0e+").is_none());
}

#[test]
unconstrained
fn value_exponent_minus_one_point_zero_e_minus()
{
    assert(JSON::parse("-1.0e-").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_e_zero_point_zero_e_zero()
{
    assert(JSON::parse("0e0.0e0").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_e_plus()
{
    assert(JSON::parse("0e+").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_e_minus()
{
    assert(JSON::parse("0e-").is_none());
}

#[test]
unconstrained
fn value_exponent_zero_e_zero_one()
{
    let json = "0e01";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_zero_zero_one()
{
    let json = "0e001";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_one_zero()
{
    let json = "0e10";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_one_zero_one()
{
    let json = "0e101";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_e_plus_zero()
{
    let json = "1e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_e_minus_zero()
{
    let json = "1e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_e_plus_zero()
{
    let json = "10e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_e_minus_zero()
{
    let json = "10e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_e_plus_zero()
{
    let json = "100e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_e_minus_zero()
{
    let json = "100e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_one_e_plus_zero()
{
    let json = "1001e+0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_one_e_minus_zero()
{
    let json = "1001e-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_e_plus_zero_one()
{
    let json = "100e+01";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_zero_e_minus_zero_one()
{
    let json = "100e-01";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_one_e_plus_one_zero_one()
{
    let json = "101e+101";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_exponent_one_zero_one_e_minus_one_zero_one()
{
    let json = "101e-101";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}
