use dep::rontosoft::JSON;
use dep::rontosoft::globals::MINUS;

global BYTE_NULL : u8 = 0x00;

#[test]
unconstrained
fn convert_value_field_array()
{
    let bytes : [u8] = [0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = bytes.as_field();

    assert(result.unwrap() == 4293867510);
}

#[test]
unconstrained
fn convert_value_field_minus_array()
{
    let bytes : [u8] = [MINUS, 0x34, 0x32, 0x39, 0x33, 0x38, 0x36, 0x37, 0x35, 0x31, 0x30];
    let result = bytes.as_field();

    assert(result.unwrap() == -4293867510);
}

#[test]
unconstrained
fn convert_value_field_array_with_nulls()
{
    let bytes : [u8] = [0x34, 0x32, 0x39, 0x33, 0x38];
    let result = bytes.as_field();

    assert(result.unwrap() == 42938);
}

#[test]
unconstrained
fn convert_value_field_array_value_overflows()
{
    // max (Field) + 1
    let bytes : [u8] = [0x32,0x31,0x38,0x38,0x38,0x32,0x34,0x32,0x38,0x37,0x31,0x38,0x33,0x39,0x32,0x37,0x35,0x32,0x32,0x32,0x32,0x34,0x36,0x34,0x30,0x35,0x37,0x34,0x35,0x32,0x35,0x37,0x32,0x37,0x35,0x30,0x38,0x38,0x35,0x34,0x38,0x33,0x36,0x34,0x34,0x30,0x30,0x34,0x31,0x36,0x30,0x33,0x34,0x33,0x34,0x33,0x36,0x39,0x38,0x32,0x30,0x34,0x31,0x38,0x36,0x35,0x37,0x35,0x38,0x30,0x38,0x34,0x39,0x35,0x36,0x31,0x38];
    let result = bytes.as_field();

    assert(result.unwrap() == 1);
}

#[test]
unconstrained
fn convert_value_field_array_with_leading_null()
{
    let bytes : [u8] = [BYTE_NULL, 0x34, 0x39, 0x36];

    assert(bytes.as_field().is_none() == true);
}

#[test]
unconstrained
fn convert_value_field_array_with_trailing_null()
{
    let bytes : [u8] = [0x34, 0x39, 0x36, BYTE_NULL];

    assert(bytes.as_field().is_none() == true);
}

#[test]
unconstrained
fn convert_value_field_array_with_mixed_null()
{
    let bytes : [u8] = [0x34, 0x32, BYTE_NULL, 0x34, 0x39, 0x36];

    assert(bytes.as_field().is_none() == true);
}

#[test]
unconstrained
fn convert_value_field_three_zero()
{
    assert(JSON::parse("30").get_field("").unwrap() == 30);
}

#[test]
unconstrained
fn convert_value_field_minus_three_zero()
{
    assert(JSON::parse("-30").get_field("").unwrap() == -30);
}

#[test]
unconstrained
fn convert_property_field_three_zero()
{
    assert(JSON::parse("{'a':30}").get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero()
{
    assert(JSON::parse("{'a':-30}").get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_zero()
{
    assert(JSON::parse("{'a':30e0}").get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_zero()
{
    assert(JSON::parse("{'a':-30e0}").get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':30e+0}").get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':-30e+0}").get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':30e-0}").get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':-30e-0}").get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_one()
{
    assert(JSON::parse("{'a':30e1}").get_field("a").unwrap() == 300);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_one()
{
    assert(JSON::parse("{'a':-30e1}").get_field("a").unwrap() == -300);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_plus_one()
{
    assert(JSON::parse("{'a':30e+1}").get_field("a").unwrap() == 300);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_plus_one()
{
    assert(JSON::parse("{'a':-30e+1}").get_field("a").unwrap() == -300);
}

#[test]
unconstrained
fn convert_property_field_three_zero_e_minus_one()
{
    assert(JSON::parse("{'a':30e-1}").get_field("a").unwrap() == 3);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_e_minus_one()
{
    assert(JSON::parse("{'a':-30e-1}").get_field("a").unwrap() == -3);
}

#[test]
unconstrained
fn convert_property_field_plus_three_zero()
{
    assert(JSON::parse("{'a':+30}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_three_zero()
{
    assert(JSON::parse("{'a':'30'}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_minus_three_zero()
{
    assert(JSON::parse("{'a':'-30'}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_thirty()
{
    assert(JSON::parse("{'a':'thirty'}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_zero_point_zero()
{
    assert(JSON::parse("{'a':30.0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_minus_three_zero_point_zero()
{
    assert(JSON::parse("{'a':-30.0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_colon_zero()
{
    assert(JSON::parse("{'a':3:0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_space_zero()
{
    assert(JSON::parse("{'a':3 0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_left_brace_zero()
{
    assert(JSON::parse("{'a':3{0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_right_brace_zero()
{
    assert(JSON::parse("{'a':3}0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_quote_zero()
{
    assert(JSON::parse("{'a':3'0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_comma_zero()
{
    assert(JSON::parse("{'a':3,0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_comma_space_zero()
{
    assert(JSON::parse("{'a':3, 0}").get_field("a").is_none() == true);
}

#[test]
unconstrained
fn convert_property_field_three_space_comma_zero()
{
    assert(JSON::parse("{'a':3 ,0}").get_field("a").is_none() == true);
}
