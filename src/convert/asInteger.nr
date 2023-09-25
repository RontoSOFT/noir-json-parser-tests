use dep::std::option::Option;

use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::utils::int127FromUnsigned;
use dep::rontosoft::parse::JSON;
use dep::rontosoft::convert::asInteger;


#[test]
fn convert_StringBytes_minus_array_as_integer()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-4293867510));
}

#[test]
fn convert_StringBytes_minus_array_with_nulls_as_integer()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-42938));
}

#[test]
fn convert_StringBytes_array_value_overflows_as_integer()
{
    // max (u126) + 1
    // let bytes = [0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x30,0x30,0x30,0x30,0x30,0x30];
    let bytes = [0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x35,0x32,0x38,0x36,0x34,0x31];
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 1);
}

#[test]
fn convert_StringBytes_minus_array_with_leading_null_as_integer()
{
    let bytes = [BYTE_NULL, MINUS, 0x39, 0x36 ];
    let result = asInteger(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn convert_StringBytes_array_with_sparse_digits_as_integer()
{
    let bytes = [0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asInteger(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_minus_three_zero_as_integer()
{
    let bytes : [u8; 3] = JSON::new("{'a':-30}").get("a").value;
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == int127FromUnsigned(-30));
}

#[test]
fn property_string_minus_three_zero_as_integer()
{
    let bytes : [u8; 3] = JSON::new("{'a':'-30'}").get("a").value;
    let result = asInteger(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_zero_as_integer()
{
    let bytes : [u8; 3] = JSON::new("{'a':30}").get("a").value;
    let result = asInteger(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 30);
}

#[test]
fn property_number_three_zero_point_zero_as_integer()
{
    let bytes : [u8; 3] = JSON::new("{'a':30.0}").get("a").value;
    let result = asInteger(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_string_thirty_as_integer()
{
    let bytes : [u8; 3] = JSON::new("{'a':'thirty'}").get("a").value;
    let result = asInteger(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}
