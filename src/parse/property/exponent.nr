use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_exponent_zero_e_zero()
{
    let value = "0e0";
    assert(JSON::parse("{'a':0e0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_E_zero()
{
    let value = "0E0";
    assert(JSON::parse("{'a':0E0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_plus_zero()
{
    let value = "0e+0";
    assert(JSON::parse("{'a':0e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_minus_zero()
{
    let value = "0e-0";
    assert(JSON::parse("{'a':0e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_minus_zero_e_minus_zero()
{
    let value = "-0e-0";
    assert(JSON::parse("{'a':-0e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_minus_zero_e_plus_zero()
{
    let value = "-0e+0";
    assert(JSON::parse("{'a':-0e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_point_zero_e_zero_plus_zero()
{
    let value = "0.0e+0";
    assert(JSON::parse("{'a':0.0e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_point_zero_e_zero_minus_zero()
{
    let value = "0.0e-0";
    assert(JSON::parse("{'a':0.0e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_minus_zero_point_zero_e_zero_minus_zero()
{
    let value = "-0.0e-0";
    assert(JSON::parse("{'a':-0.0e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_minus_zero_point_zero_e_zero_plus_zero()
{
    let value = "-0.0e+0";
    assert(JSON::parse("{'a':-0.0e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn value_exponent_zero_e_zero_dot_zero()
{
    assert(JSON::parse("{'a':0e0.0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':+0e+0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':+0e-0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_zero_point_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':+0.0e+0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_zero_point_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':+0.0e-0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_point_zero_e_letter()
{
    assert(JSON::parse("{'a':0.0ef}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_plus_zero_e_zero()
{
    assert(JSON::parse("{'a':0+e0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_plus_zero_E_zero()
{
    assert(JSON::parse("{'a':0+E0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_minus_zero_e_minus_minus_zero()
{
    assert(JSON::parse("{'a':-0e--0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_point_zero_e_zero_plus_plus_zero()
{
    assert(JSON::parse("{'a':0.0e++0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_e()
{
    assert(JSON::parse("{'a':e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_dot_e()
{
    assert(JSON::parse("{'a':.e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_minus_e()
{
    assert(JSON::parse("{'a':-e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_e()
{
    assert(JSON::parse("{'a':+e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_e_minus()
{
    assert(JSON::parse("{'a':e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_e_plus()
{
    assert(JSON::parse("{'a':e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_e_minus_zero()
{
    assert(JSON::parse("{'a':e-0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_e_plus_zero()
{
    assert(JSON::parse("{'a':e+0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_minus_dot_e()
{
    assert(JSON::parse("{'a':-.e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_plus_dot_e()
{
    assert(JSON::parse("{'a':+.e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_e()
{
    assert(JSON::parse("{'a':1e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_e_minus()
{
    assert(JSON::parse("{'a':1e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_e_plus()
{
    assert(JSON::parse("{'a':1e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_e()
{
    assert(JSON::parse("{'a':1.e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_e_minus()
{
    assert(JSON::parse("{'a':1.e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_e_plus()
{
    assert(JSON::parse("{'a':1.e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_zero_e()
{
    assert(JSON::parse("{'a':1.0e}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_zero_e_minus()
{
    assert(JSON::parse("{'a':1.0e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_one_point_zero_e_plus()
{
    assert(JSON::parse("{'a':1.0e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_minus_one_point_zero_e_plus()
{
    assert(JSON::parse("{'a':-1.0e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_minus_one_point_zero_e_minus()
{
    assert(JSON::parse("{'a':-1.0e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_zero_point_zero_e_zero()
{
    assert(JSON::parse("{'a':0e0.0e0}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_plus()
{
    assert(JSON::parse("{'a':0e+}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_minus()
{
    assert(JSON::parse("{'a':0e-}").is_none() == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_zero_one()
{
    let value = "0e01";
    assert(JSON::parse("{'a':0e01}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_zero_zero_one()
{
    let value = "0e001";
    assert(JSON::parse("{'a':0e001}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_one_zero()
{
    let value = "0e10";
    assert(JSON::parse("{'a':0e10}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_zero_e_one_zero_one()
{
    let value = "0e101";
    assert(JSON::parse("{'a':0e101}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_e_plus_zero()
{
    let value = "1e+0";
    assert(JSON::parse("{'a':1e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_e_minus_zero()
{
    let value = "1e-0";
    assert(JSON::parse("{'a':1e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_e_plus_zero()
{
    let value = "10e+0";
    assert(JSON::parse("{'a':10e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_e_minus_zero()
{
    let value = "10e-0";
    assert(JSON::parse("{'a':10e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_e_plus_zero()
{
    let value = "100e+0";
    assert(JSON::parse("{'a':100e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_e_minus_zero()
{
    let value = "100e-0";
    assert(JSON::parse("{'a':100e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_one_e_plus_zero()
{
    let value = "1001e+0";
    assert(JSON::parse("{'a':1001e+0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_one_e_minus_zero()
{
    let value = "1001e-0";
    assert(JSON::parse("{'a':1001e-0}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_e_plus_zero_one()
{
    let value = "100e+01";
    assert(JSON::parse("{'a':100e+01}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_zero_e_minus_zero_one()
{
    let value = "100e-01";
    assert(JSON::parse("{'a':100e-01}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_one_e_plus_one_zero_one()
{
    let value = "101e+101";
    assert(JSON::parse("{'a':101e+101}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_exponent_one_zero_one_e_minus_one_zero_one()
{
    let value = "101e-101";
    assert(JSON::parse("{'a':101e-101}").get("a").eq_string(value) == true);
}
