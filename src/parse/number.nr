use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn property_number_zero()
{
    let (key, value) = ("a", "0");
    let bytes = JSON::parse("{'a':0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_one()
{
    let (key, value) = ("a", "1");
    let bytes = JSON::parse("{'a':1}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero()
{
    let (key, value) = ("a", "100");
    let bytes = JSON::parse("{'a':100}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_one()
{
    let (key, value) = ("a", "1001");
    let bytes = JSON::parse("{'a':1001}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_multiple_one_two_three_four_five()
{
    let (key, value) = ("a", "12345");
    let bytes = JSON::parse("{'a':12345}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus()
{
    assert(JSON::parse("{'a':-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_zero()
{
    let (key, value) = ("a", "-0");
    let bytes = JSON::parse("{'a':-0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_one()
{
    let (key, value) = ("a", "-1");
    let bytes = JSON::parse("{'a':-1}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_one_zero_zero()
{
    let (key, value) = ("a", "-100");
    let bytes = JSON::parse("{'a':-100}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_one_zero_zero_one()
{
    let (key, value) = ("a", "-1001");
    let bytes = JSON::parse("{'a':-1001}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_one_two_three_four_five()
{
    let (key, value) = ("a", "-12345");
    let bytes = JSON::parse("{'a':-12345}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_plus()
{
    assert(JSON::parse("{'a':+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_zero()
{
    assert(JSON::parse("{'a':+0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_one()
{
    assert(JSON::parse("{'a':+1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_one_two_three_four_five()
{
    assert(JSON::parse("{'a':+12345}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_double_zero()
{
    assert(JSON::parse("{'a':00}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_leading_zero_one()
{
    assert(JSON::parse("{'a':01}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_zero_one()
{
    assert(JSON::parse("{'a':001}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_one_two_three_four_five()
{
    assert(JSON::parse("{'a':012345}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_double_minus_zero()
{
    assert(JSON::parse("{'a':--0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_double_minus_one()
{
    assert(JSON::parse("{'a':--1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_minus()
{
    assert(JSON::parse("{'a':0-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_minus()
{
    assert(JSON::parse("{'a':1-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_zero_minus()
{
    assert(JSON::parse("{'a':-0-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_one_minus()
{
    assert(JSON::parse("{'a':-1-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_minus_zero()
{
    assert(JSON::parse("{'a':0-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_minus_one()
{
    assert(JSON::parse("{'a':1-1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_zero_minus_zero()
{
    assert(JSON::parse("{'a':-0-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_one_minus_one()
{
    assert(JSON::parse("{'a':-1-1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_comma()
{
    assert(JSON::parse("{'a':1,}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_colon()
{
    assert(JSON::parse("{'a':1:}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_quote()
{
    assert(JSON::parse("{'a':1'}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_left_brace()
{
    assert(JSON::parse("{'a':1{}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_right_brace()
{
    assert(JSON::parse("{'a':1}}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_left_bracket()
{
    assert(JSON::parse("{'a':1[}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_right_bracket()
{
    assert(JSON::parse("{'a':1]}").bytesOf("a").is_none() == true);
}
