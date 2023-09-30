use dep::std::option::Option;

use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::JSON;
use dep::rontosoft::convert::asField;

#[test]
unconstrained
fn convert_bytes_array_as_field()
{
    let bytes = [0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asField(bytes);

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == 4293867510);
}

#[test]
unconstrained
fn convert_bytes_minus_array_as_field()
{
    let bytes = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = asField(bytes);

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -4293867510);
}

#[test]
unconstrained
fn convert_bytes_array_with_nulls_as_field()
{
    let bytes = [0x34, 0x32, 0x39, 0x33, 0x38, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];
    let result = asField(bytes);

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == 42938);
}

#[test]
unconstrained
fn convert_bytes_array_value_overflows_as_field()
{
    // max (Field) + 1
    let bytes = [0x32,0x31,0x38,0x38,0x38,0x32,0x34,0x32,0x38,0x37,0x31,0x38,0x33,0x39,0x32,0x37,0x35,0x32,0x32,0x32,0x32,0x34,0x36,0x34,0x30,0x35,0x37,0x34,0x35,0x32,0x35,0x37,0x32,0x37,0x35,0x30,0x38,0x38,0x35,0x34,0x38,0x33,0x36,0x34,0x34,0x30,0x30,0x34,0x31,0x36,0x30,0x33,0x34,0x33,0x34,0x33,0x36,0x39,0x38,0x32,0x30,0x34,0x31,0x38,0x36,0x35,0x37,0x35,0x38,0x30,0x38,0x34,0x39,0x35,0x36,0x31,0x38];
    let result = asField(bytes);

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == 1);
}

#[test]
unconstrained
fn convert_bytes_array_with_leading_null_as_field()
{
    let bytes = [BYTE_NULL, 0x34, 0x39, 0x36 ];

    assert(asField(bytes).is_none());
}

#[test]
unconstrained
fn convert_bytes_array_with_sparse_digits_as_field()
{
    let bytes = [0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36, BYTE_NULL, BYTE_NULL, BYTE_NULL, BYTE_NULL];

    assert(asField(bytes).is_none());
}

#[test]
unconstrained
fn property_number_three_zero_as_field()
{
    let result = JSON::parse("{'a':30}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == 30);
}

#[test]
unconstrained
fn property_string_three_zero_as_field()
{
    assert(JSON::parse("{'a':'30'}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_escaped_three_zero_as_field()
{
    assert(JSON::parse("{'a':\"30\"}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_three_zero_as_field()
{
    let result = JSON::parse("{'a':-30}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_zero_as_field()
{
    let result = JSON::parse("{'a':-30e0}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_one_as_field()
{
    let result = JSON::parse("{'a':-30e1}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -300);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_plus_one_as_field()
{
    let result = JSON::parse("{'a':-30e+1}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -300);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_minus_one_as_field()
{
    let result = JSON::parse("{'a':-30e-1}").getField("a");

    assert(result.is_some() == true);
    assert(result.unwrap_unchecked() == -3);
}

#[test]
unconstrained
fn property_number_three_zero_point_zero_as_field()
{
    assert(JSON::parse("{'a':30.0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_thirty_as_field()
{
    assert(JSON::parse("{'a':'thirty'}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_colon_zero_as_field()
{
    assert(JSON::parse("{'a':3:0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_space_zero_as_field()
{
    assert(JSON::parse("{'a':3 0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_left_brace_zero_as_field()
{
    assert(JSON::parse("{'a':3{0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_right_brace_zero_as_field()
{
    assert(JSON::parse("{'a':3}0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_quote_zero_as_field()
{
    assert(JSON::parse("{'a':3'0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_escaped_quote_zero_as_field()
{
    assert(JSON::parse("{'a':3\"0}").getField("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_comma_zero_as_field()
{
    assert(JSON::parse("{'a':3,0}").getField("a").is_none() == true);
}
