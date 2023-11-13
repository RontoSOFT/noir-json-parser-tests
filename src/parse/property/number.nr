use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_number_zero()
{
    let value = "0";
    assert(JSON::parse("{'a':0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one()
{
    let value = "1";
    assert(JSON::parse("{'a':1}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero()
{
    let value = "100";
    assert(JSON::parse("{'a':100}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_one()
{
    let value = "1001";
    assert(JSON::parse("{'a':1001}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_multiple_one_two_three_four_five()
{
    let value = "12345";
    assert(JSON::parse("{'a':12345}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus()
{
    assert(JSON::parse("{'a':-}").is_none());
}

#[test]
unconstrained
fn property_number_minus_zero()
{
    let value = "-0";
    assert(JSON::parse("{'a':-0}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_one()
{
    let value = "-1";
    assert(JSON::parse("{'a':-1}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_one_zero_zero()
{
    let value = "-100";
    assert(JSON::parse("{'a':-100}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_one_zero_zero_one()
{
    let value = "-1001";
    assert(JSON::parse("{'a':-1001}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_one_two_three_four_five()
{
    let value = "-12345";
    assert(JSON::parse("{'a':-12345}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_plus()
{
    assert(JSON::parse("{'a':+}").is_none());
}

#[test]
unconstrained
fn property_number_plus_zero()
{
    assert(JSON::parse("{'a':+0}").is_none());
}

#[test]
unconstrained
fn property_number_plus_one()
{
    assert(JSON::parse("{'a':+1}").is_none());
}

#[test]
unconstrained
fn property_number_plus_one_two_three_four_five()
{
    assert(JSON::parse("{'a':+12345}").is_none());
}

#[test]
unconstrained
fn property_number_double_zero()
{
    assert(JSON::parse("{'a':00}").is_none());
}

#[test]
unconstrained
fn property_number_leading_zero_one()
{
    assert(JSON::parse("{'a':01}").is_none());
}

#[test]
unconstrained
fn property_number_zero_zero_one()
{
    assert(JSON::parse("{'a':001}").is_none());
}

#[test]
unconstrained
fn property_number_zero_one_two_three_four_five()
{
    assert(JSON::parse("{'a':012345}").is_none());
}

#[test]
unconstrained
fn property_double_minus_zero()
{
    assert(JSON::parse("{'a':--0}").is_none());
}

#[test]
unconstrained
fn property_double_minus_one()
{
    assert(JSON::parse("{'a':--1}").is_none());
}

#[test]
unconstrained
fn property_number_zero_minus()
{
    assert(JSON::parse("{'a':0-}").is_none());
}

#[test]
unconstrained
fn property_number_one_minus()
{
    assert(JSON::parse("{'a':1-}").is_none());
}

#[test]
unconstrained
fn property_number_minus_zero_minus()
{
    assert(JSON::parse("{'a':-0-}").is_none());
}

#[test]
unconstrained
fn property_number_minus_one_minus()
{
    assert(JSON::parse("{'a':-1-}").is_none());
}

#[test]
unconstrained
fn property_number_zero_minus_zero()
{
    assert(JSON::parse("{'a':0-0}").is_none());
}

#[test]
unconstrained
fn property_number_one_minus_one()
{
    assert(JSON::parse("{'a':1-1}").is_none());
}

#[test]
unconstrained
fn property_number_minus_zero_minus_zero()
{
    assert(JSON::parse("{'a':-0-0}").is_none());
}

#[test]
unconstrained
fn property_number_minus_one_minus_one()
{
    assert(JSON::parse("{'a':-1-1}").is_none());
}

#[test]
unconstrained
fn property_number_one_colon()
{
    assert(JSON::parse("{'a':1:}").is_none());
}

#[test]
unconstrained
fn property_number_one_quote()
{
    assert(JSON::parse("{'a':1'}").is_none());
}

#[test]
unconstrained
fn property_number_one_left_brace()
{
    assert(JSON::parse("{'a':1{}").is_none());
}

#[test]
unconstrained
fn property_number_one_right_brace()
{
    assert(JSON::parse("{'a':1}}").is_none());
}

#[test]
unconstrained
fn property_number_one_left_bracket()
{
    assert(JSON::parse("{'a':1[}").is_none());
}

#[test]
unconstrained
fn property_number_one_right_bracket()
{
    assert(JSON::parse("{'a':1]}").is_none());
}

#[test]
unconstrained
fn property_number_one_space()
{
    assert(JSON::parse("{'a':1 2}").is_none());
}

#[test]
unconstrained
fn property_number_one_letter()
{
    assert(JSON::parse("{'a':1x}").is_none());
}

#[test]
unconstrained
fn property_number_one_literal_letter()
{
    assert(JSON::parse("{'a':1f}").is_none());
}
