use dep::std::option::Option;

use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::utils::int127FromUnsigned;
use dep::rontosoft::JSON;
use dep::rontosoft::convert::asInteger;


#[test]
unconstrained
fn convert_bytes_minus_array_as_integer()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-4293867510));
}

#[test]
unconstrained
fn convert_bytes_minus_array_with_nulls_as_integer()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-42938));
}

#[test]
unconstrained
fn convert_bytes_array_value_overflows_as_integer()
{
    // max (u126) + 1
    // let bytes = [0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x30,0x30,0x30,0x30,0x30,0x30];
    let bytes = [0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x35,0x32,0x38,0x36,0x34,0x31];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 1);
}

#[test]
unconstrained
fn convert_bytes_minus_array_with_leading_null_as_integer()
{
    let bytes = [BYTE_NULL, MINUS, 0x39, 0x36 ];

    assert(asInteger(bytes).is_none());
}

#[test]
unconstrained
fn convert_bytes_array_with_sparse_digits_as_integer()
{
    let bytes = [0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];

    assert(asInteger(bytes).is_none());
}

#[test]
unconstrained
fn property_number_minus_three_zero_as_integer()
{
    let result = JSON::parse("{'a':-30}").getInteger("a");

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-30));
}

#[test]
unconstrained
fn property_string_minus_three_zero_as_integer()
{
    assert(JSON::parse("{'a':'-30'}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_zero_as_integer()
{
    let result = JSON::parse("{'a':30}").getInteger("a");

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 30);
}

#[test]
unconstrained
fn property_number_three_zero_point_zero_as_integer()
{
    assert(JSON::parse("{'a':30.0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_thirty_as_integer()
{
    assert(JSON::parse("{'a':'thirty'}").getInteger("a").is_none() == true);
}
