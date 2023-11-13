use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_fraction_zero_point_zero()
{
    let json = "0.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_zero_point_single_digits()
{
    let json = "0.1";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_zero_point_multiple_digits()
{
    let json = "0.12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_zero_point_multiple_digits()
{
    let json = "-0.12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_single_digit_point_zero()
{
    let json = "1.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_single_digit_point_zero()
{
    let json = "-1.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_single_digit_point_single_digit()
{
    let json = "1.2";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_single_digit_point_single_digit()
{
    let json = "-1.2";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_single_digit_point_multiple_digits()
{
    let json = "1.23456";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_single_digit_point_multiple_digits()
{
    let json = "-1.23456";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_multiple_digits_point_zero()
{
    let json = "12345.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_multiple_digits_point_zero()
{
    let json = "-12345.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_multiple_digits_point_single_digit()
{
    let json = "12345.6";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_multiple_digits_point_single_digit()
{
    let json = "-12345.6";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_multiple_digits_point_multiple_digits()
{
    let json = "12345.67890";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_minus_multiple_digits_point_multiple_digits()
{
    let json = "-12345.67890";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_fraction_zero_point_zero_letter()
{
    assert(JSON::parse("0.0f").is_none());
}

#[test]
unconstrained
fn value_minus_fraction_one_point_minus_zero()
{
    assert(JSON::parse("-1.-0").is_none());
}

#[test]
unconstrained
fn value_fraction_one_point_minus_zero()
{
    assert(JSON::parse("1.-0").is_none());
}

#[test]
unconstrained
fn value_fraction_zero_point_point_zero()
{
    assert(JSON::parse("0..0").is_none());
}

#[test]
unconstrained
fn value_fraction_zero_point()
{
    assert(JSON::parse("0.").is_none());
}

#[test]
unconstrained
fn value_fraction_point_zero()
{
    assert(JSON::parse(".0").is_none());
}

#[test]
unconstrained
fn value_fraction_minus_point()
{
    assert(JSON::parse("-.").is_none());
}

#[test]
unconstrained
fn value_fraction_point_minus()
{
    assert(JSON::parse(".-").is_none());
}

#[test]
unconstrained
fn value_fraction_plus_point()
{
    assert(JSON::parse("+.").is_none());
}

#[test]
unconstrained
fn value_point_plus()
{
    assert(JSON::parse(".+").is_none());
}
