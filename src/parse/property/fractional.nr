use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_fraction_zero_point_zero()
{
    let value = "0.0";
    assert(JSON::parse("{'a':0.0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_zero_point_single_digits()
{
    let value = "0.1";
    assert(JSON::parse("{'a':0.1}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_zero_point_multiple_digits()
{
    let value = "0.12345";
    assert(JSON::parse("{'a':0.12345}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_zero_point_multiple_digits()
{
    let value = "-0.12345";
    assert(JSON::parse("{'a':-0.12345}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_single_digit_point_zero()
{
    let value = "1.0";
    assert(JSON::parse("{'a':1.0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_single_digit_point_zero()
{
    let value = "-1.0";
    assert(JSON::parse("{'a':-1.0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_single_digit_point_zero_e_zero()
{
    let value = "1.0e0";
    assert(JSON::parse("{'a':1.0e0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_single_digit_point_zero_e_plus_zero()
{
    let value = "1.0e+0";
    assert(JSON::parse("{'a':1.0e+0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_single_digit_point_zero_e_minus_zero()
{
    let value = "1.0e-0";
    assert(JSON::parse("{'a':1.0e-0}").get("a").unwrap().eq_string(value) == true);
}


#[test]
unconstrained
fn property_fraction_single_digit_point_single_digit()
{
    let value = "1.2";
    assert(JSON::parse("{'a':1.2}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_single_digit_point_single_digit()
{
    let value = "-1.2";
    assert(JSON::parse("{'a':-1.2}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_single_digit_point_multiple_digits()
{
    let value = "1.23456";
    assert(JSON::parse("{'a':1.23456}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_single_digit_point_multiple_digits()
{
    let value = "-1.23456";
    assert(JSON::parse("{'a':-1.23456}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_multiple_digits_point_zero()
{
    let value = "12345.0";
    assert(JSON::parse("{'a':12345.0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_multiple_digits_point_zero()
{
    let value = "-12345.0";
    assert(JSON::parse("{'a':-12345.0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_multiple_digits_point_single_digit()
{
    let value = "12345.6";
    assert(JSON::parse("{'a':12345.6}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_multiple_digits_point_single_digit()
{
    let value = "-12345.6";
    assert(JSON::parse("{'a':-12345.6}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_multiple_digits_point_multiple_digits()
{
    let value = "12345.67890";
    assert(JSON::parse("{'a':12345.67890}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_minus_multiple_digits_point_multiple_digits()
{
    let value = "-12345.67890";
    assert(JSON::parse("{'a':-12345.67890}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_fraction_zero_point_zero_letter()
{
    assert(JSON::parse("{'a':0.0f}").is_none());
}

#[test]
unconstrained
fn property_minus_fraction_one_point_minus_zero()
{
    assert(JSON::parse("{'a':-1.-0}").is_none());
}

#[test]
unconstrained
fn property_fraction_one_point_minus_zero()
{
    assert(JSON::parse("{'a':1.-0}").is_none());
}

#[test]
unconstrained
fn property_fraction_zero_point_point_zero()
{
    assert(JSON::parse("{'a':0..0}").is_none());
}

#[test]
unconstrained
fn property_fraction_zero_point()
{
    assert(JSON::parse("{'a':0.}").is_none());
}

#[test]
unconstrained
fn property_fraction_point_zero()
{
    assert(JSON::parse("{'a':.0}").is_none());
}

#[test]
unconstrained
fn property_fraction_minus_point()
{
    assert(JSON::parse("{'a':-.}").is_none());
}

#[test]
unconstrained
fn property_fraction_point_minus()
{
    assert(JSON::parse("{'a':.-}").is_none());
}

#[test]
unconstrained
fn property_fraction_plus_point()
{
    assert(JSON::parse("{'a':+.}").is_none());
}

#[test]
unconstrained
fn property_fraction_point_plus()
{
    assert(JSON::parse("{'a':.+}").is_none());
}
