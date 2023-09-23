use dep::std::option::Option;

use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::convert::BytesU8;
use dep::rontosoft::convert::StringBytes;
use dep::rontosoft::parse::JSON;

#[test]
fn convert_StringBytes_minus_array_as_integer()
{
    let bytes = StringBytes::new_valid([MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30]);
    let result = bytes.asInteger();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == (-4293867510 as u126) as i127);
}

#[test]
fn convert_StringBytes_minus_array_with_nulls_as_integer()
{
    let bytes = StringBytes::new_valid([MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL]);
    let result = bytes.asInteger();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == (-42938 as u126) as i127);
}

#[test]
fn convert_StringBytes_array_value_overflows_as_integer()
{
    // max (u126) + 1
    // let bytes = StringBytes::new_valid([0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x30,0x30,0x30,0x30,0x30,0x30]);
    let bytes = StringBytes::new_valid([0x38,0x35,0x30,0x37,0x30,0x35,0x39,0x31,0x37,0x33,0x30,0x32,0x33,0x34,0x36,0x31,0x35,0x38,0x36,0x35,0x38,0x34,0x33,0x36,0x35,0x31,0x38,0x35,0x37,0x39,0x34,0x32,0x30,0x35,0x32,0x38,0x36,0x34,0x31]);
    let result = bytes.asInteger();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 1);
}

#[test]
fn convert_StringBytes_minus_array_with_leading_null_as_integer()
{
    let bytes = StringBytes::new_valid([BYTE_NULL, MINUS, 0x39, 0x36 ]);
    let result = bytes.asInteger();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn convert_StringBytes_array_with_sparse_digits_as_integer()
{
    let bytes = StringBytes::new_valid([0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL]);
    let result = bytes.asInteger();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_minus_three_zero_as_integer()
{
    let bytes : BytesU8 = JSON::new("{'name':'John Doe','age':-30,'isEmployed':true}").get("age").value;
    let result = bytes.asInteger();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == (-30 as u126) as i127);
}

#[test]
fn property_string_minus_three_zero_as_integer()
{
    let bytes : BytesU8 = JSON::new("{'name':'John Doe','age':'-30','isEmployed':true}").get("age").value;
    let result = bytes.asInteger();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_zero_as_integer()
{
    let bytes : BytesU8 = JSON::new("{'name':'John Doe','age':30,'isEmployed':true}").get("age").value;
    let result = bytes.asInteger();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 30);
}

#[test]
fn property_number_three_zero_point_zero_as_integer()
{
    let bytes : BytesU8 = JSON::new("{'name':'John Doe','age':30.0,'isEmployed':true}").get("age").value;
    let result = bytes.asInteger();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_string_thirty_as_integer()
{
    let bytes : BytesU8 = JSON::new("{'name':'John Doe','age':'thirty','isEmployed':true}").get("age").value;
    let result = bytes.asInteger();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}
