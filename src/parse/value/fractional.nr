use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_number_zero_point_zero()
{
    let json = "0.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_zero_point_single_digits()
{
    let json = "0.1";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_zero_point_multiple_digits()
{
    let json = "0.12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_zero_point_multiple_digits()
{
    let json = "-0.12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_single_digit_point_zero()
{
    let json = "1.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_single_digit_point_zero()
{
    let json = "-1.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_single_digit_point_single_digit()
{
    let json = "1.2";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_single_digit_point_single_digit()
{
    let json = "-1.2";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_single_digit_point_multiple_digits()
{
    let json = "1.23456";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_single_digit_point_multiple_digits()
{
    let json = "-1.23456";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_multiple_digits_point_zero()
{
    let json = "12345.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_multiple_digits_point_zero()
{
    let json = "-12345.0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_multiple_digits_point_single_digit()
{
    let json = "12345.6";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_multiple_digits_point_single_digit()
{
    let json = "-12345.6";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_multiple_digits_point_multiple_digits()
{
    let json = "12345.67890";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_multiple_digits_point_multiple_digits()
{
    let json = "-12345.67890";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_zero_point_zero_letter()
{
    assert(JSON::parse("0.0f").doc.len() == 0);
}

#[test]
unconstrained
fn value_minus_number_one_point_minus_zero()
{
    assert(JSON::parse("-1.-0").doc.len() == 0);
}

#[test]
unconstrained
fn value_number_one_point_minus_zero()
{
    assert(JSON::parse("-1.-0").doc.len() == 0);
}

#[test]
unconstrained
fn value_number_zero_point()
{
    assert(JSON::parse("0.").doc.len() == 0);
}

#[test]
unconstrained
fn value_number_point_zero()
{
    assert(JSON::parse(".0").doc.len() == 0);
}
