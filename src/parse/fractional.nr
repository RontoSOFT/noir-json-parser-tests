use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn property_number_zero_point_zero()
{
    let (key, value) = ("a", "0.0");
    let bytes = JSON::parse("{'a':0.0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_zero_point_single_digits()
{
    let (key, value) = ("a", "0.1");
    let bytes = JSON::parse("{'a':0.1}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_zero_point_multiple_digits()
{
    let (key, value) = ("a", "0.12345");
    let bytes = JSON::parse("{'a':0.12345}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_zero_point_multiple_digits()
{
    let (key, value) = ("a", "-0.12345");
    let bytes = JSON::parse("{'a':-0.12345}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_single_digit_point_zero()
{
    let (key, value) = ("a", "1.0");
    let bytes = JSON::parse("{'a':1.0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_single_digit_point_zero()
{
    let (key, value) = ("a", "-1.0");
    let bytes = JSON::parse("{'a':-1.0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_single_digit_point_single_digit()
{
    let (key, value) = ("a", "1.2");
    let bytes = JSON::parse("{'a':1.2}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_single_digit_point_single_digit()
{
    let (key, value) = ("a", "-1.2");
    let bytes = JSON::parse("{'a':-1.2}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_single_digit_point_multiple_digits()
{
    let (key, value) = ("a", "1.23456");
    let bytes = JSON::parse("{'a':1.23456}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_single_digit_point_multiple_digits()
{
    let (key, value) = ("a", "-1.23456");
    let bytes = JSON::parse("{'a':-1.23456}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_multiple_digits_point_zero()
{
    let (key, value) = ("a", "12345.0");
    let bytes = JSON::parse("{'a':12345.0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_multiple_digits_point_zero()
{
    let (key, value) = ("a", "-12345.0");
    let bytes = JSON::parse("{'a':-12345.0}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_multiple_digits_point_single_digit()
{
    let (key, value) = ("a", "12345.6");
    let bytes = JSON::parse("{'a':12345.6}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_multiple_digits_point_single_digit()
{
    let (key, value) = ("a", "-12345.6");
    let bytes = JSON::parse("{'a':-12345.6}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_multiple_digits_point_multiple_digits()
{
    let (key, value) = ("a", "12345.67890");
    let bytes = JSON::parse("{'a':12345.67890}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_minus_multiple_digits_point_multiple_digits()
{
    let (key, value) = ("a", "-12345.67890");
    let bytes = JSON::parse("{'a':-12345.67890}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_letter()
{
    assert(JSON::parse("{'a':0.0f}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_minus_number_one_point_minus_zero()
{
    assert(JSON::parse("{'a':-1.-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_minus_zero()
{
    assert(JSON::parse("{'a':-1.-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_point()
{
    assert(JSON::parse("{'a':0.}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_point_zero()
{
    assert(JSON::parse("{'a':.0}").bytesOf("a").is_none() == true);
}
