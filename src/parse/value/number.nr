use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_number_zero()
{
    let json = "0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_one()
{
    let json = "1";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_one_zero_zero()
{
    let json = "100";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_one_zero_zero_one()
{
    let json = "1001";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_multiple_one_two_three_four_five()
{
    let json = "12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus()
{
    assert(JSON::parse("-").is_empty());
}

#[test]
unconstrained
fn value_number_minus_zero()
{
    let json = "-0";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_one()
{
    let json = "-1";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_one_zero_zero()
{
    let json = "-100";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_one_zero_zero_one()
{
    let json = "-1001";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_minus_one_two_three_four_five()
{
    let json = "-12345";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_number_plus()
{
    assert(JSON::parse("+").is_empty());
}

#[test]
unconstrained
fn value_number_plus_zero()
{
    assert(JSON::parse("+0").is_empty());
}

#[test]
unconstrained
fn value_number_plus_one()
{
    assert(JSON::parse("+1").is_empty());
}

#[test]
unconstrained
fn value_number_plus_one_two_three_four_five()
{
    assert(JSON::parse("+12345").is_empty());
}

#[test]
unconstrained
fn value_number_double_zero()
{
    assert(JSON::parse("00").is_empty());
}

#[test]
unconstrained
fn value_number_leading_zero_one()
{
    assert(JSON::parse("01").is_empty());
}

#[test]
unconstrained
fn value_number_zero_zero_one()
{
    assert(JSON::parse("001").is_empty());
}

#[test]
unconstrained
fn value_number_zero_one_two_three_four_five()
{
    assert(JSON::parse("012345").is_empty());
}

#[test]
unconstrained
fn value_double_minus_zero()
{
    assert(JSON::parse("--0").is_empty());
}

#[test]
unconstrained
fn value_double_minus_one()
{
    assert(JSON::parse("--1").is_empty());
}

#[test]
unconstrained
fn value_number_zero_minus()
{
    assert(JSON::parse("0-").is_empty());
}

#[test]
unconstrained
fn value_number_one_minus()
{
    assert(JSON::parse("1-").is_empty());
}

#[test]
unconstrained
fn value_number_minus_zero_minus()
{
    assert(JSON::parse("-0-").is_empty());
}

#[test]
unconstrained
fn value_number_minus_one_minus()
{
    assert(JSON::parse("-1-").is_empty());
}

#[test]
unconstrained
fn value_number_zero_minus_zero()
{
    assert(JSON::parse("0-0").is_empty());
}

#[test]
unconstrained
fn value_number_one_minus_one()
{
    assert(JSON::parse("1-1").is_empty());
}

#[test]
unconstrained
fn value_number_minus_zero_minus_zero()
{
    assert(JSON::parse("-0-0").is_empty());
}

#[test]
unconstrained
fn value_number_minus_one_minus_one()
{
    assert(JSON::parse("-1-1").is_empty());
}

#[test]
unconstrained
fn value_number_one_comma()
{
    assert(JSON::parse("1,").is_empty());
}

#[test]
unconstrained
fn value_number_one_comma_space()
{
    assert(JSON::parse("1, ").is_empty());
}

#[test]
unconstrained
fn value_number_one_colon()
{
    assert(JSON::parse("1:").is_empty());
}

#[test]
unconstrained
fn value_number_one_quote()
{
    assert(JSON::parse("1'").is_empty());
}

#[test]
unconstrained
fn value_number_one_left_brace()
{
    assert(JSON::parse("1{").is_empty());
}

#[test]
unconstrained
fn value_number_one_right_brace()
{
    assert(JSON::parse("1}").is_empty());
}

#[test]
unconstrained
fn value_number_one_left_bracket()
{
    assert(JSON::parse("1[").is_empty());
}

#[test]
unconstrained
fn value_number_one_right_bracket()
{
    assert(JSON::parse("1]").is_empty());
}

#[test]
unconstrained
fn value_number_one_space()
{
    assert(JSON::parse("1 2").is_empty());
}

#[test]
unconstrained
fn value_number_one_letter()
{
    assert(JSON::parse("1x").is_empty());
}

#[test]
unconstrained
fn value_number_one_literal_letter()
{
    assert(JSON::parse("1f").is_empty());
}
