use dep::std::option::Option;

use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::parse::JSON;
use dep::rontosoft::convert::asField;

#[test]
fn convert_StringBytes_array_as_field()
{
    let bytes = [0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 4293867510);
}

#[test]
fn convert_StringBytes_minus_array_as_field()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -4293867510);
}

#[test]
fn convert_StringBytes_array_with_nulls_as_field()
{
    let bytes = [0x34, 0x32, 0x39, 0x33, 0x38, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 42938);
}

#[test]
fn convert_StringBytes_array_value_overflows_as_field()
{
    // max (Field) + 1
    let bytes = [0x32,0x31,0x38,0x38,0x38,0x32,0x34,0x32,0x38,0x37,0x31,0x38,0x33,0x39,0x32,0x37,0x35,0x32,0x32,0x32,0x32,0x34,0x36,0x34,0x30,0x35,0x37,0x34,0x35,0x32,0x35,0x37,0x32,0x37,0x35,0x30,0x38,0x38,0x35,0x34,0x38,0x33,0x36,0x34,0x34,0x30,0x30,0x34,0x31,0x36,0x30,0x33,0x34,0x33,0x34,0x33,0x36,0x39,0x38,0x32,0x30,0x34,0x31,0x38,0x36,0x35,0x37,0x35,0x38,0x30,0x38,0x34,0x39,0x35,0x36,0x31,0x38];
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 1);
}

#[test]
fn convert_StringBytes_array_with_leading_null_as_field()
{
    let bytes = [BYTE_NULL, 0x34, 0x39, 0x36 ];
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn convert_StringBytes_array_with_sparse_digits_as_field()
{
    let bytes = [0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':30}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == 30);
}

#[test]
fn property_string_three_zero_as_field()
{
    let bytes : [u8; 4] = JSON::new("{'a':'30'}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_string_escaped_three_zero_as_field()
{
    let bytes : [u8; 4] = JSON::new("{'a':\"30\"}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_minus_three_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':-30}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -30);
}

#[test]
fn property_number_minus_three_zero_e_zero_as_field()
{
    let bytes : [u8; 5] = JSON::new("{'a':-30e0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -30);
}

#[test]
fn property_number_minus_three_zero_e_one_as_field()
{
    let bytes : [u8; 5] = JSON::new("{'a':-30e1}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -300);
}

#[test]
fn property_number_minus_three_zero_e_plus_one_as_field()
{
    let bytes : [u8; 6] = JSON::new("{'a':-30e+1}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -300);
}

#[test]
fn property_number_minus_three_zero_e_minus_one_as_field()
{
    let bytes : [u8; 6] = JSON::new("{'a':-30e-1}").get("a").value;
    let result = asField(bytes);

    assert(result.is_some());
    assert(result.unwrap_unchecked() == -3);
}

#[test]
fn property_number_three_zero_point_zero_as_field()
{
    let bytes : [u8; 4] = JSON::new("{'a':30.0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_string_thirty_as_field()
{
    let bytes : [u8; 8] = JSON::new("{'a':'thirty'}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_colon_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3:0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_space_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3 0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_left_brace_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3{0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_right_brace_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3}0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_quote_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3'0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_escaped_quote_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3\"0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}

#[test]
fn property_number_three_comma_zero_as_field()
{
    let bytes : [u8; 3] = JSON::new("{'a':3,0}").get("a").value;
    let result = asField(bytes);

    assert(result.is_none());
    assert(result.unwrap_unchecked() == 0);
}
