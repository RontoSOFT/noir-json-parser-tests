use dep::rontosoft::JSON;
use dep::rontosoft::globals::MINUS;

global BYTE_NULL : u8 = 0x00;

#[test]
fn value_number_field()
{
    assert("123".as_field().unwrap() == 123);
}

#[test]
fn value_minus_number_field()
{
    assert("-123".as_field().unwrap() == -123);
}

#[test]
fn value_number_exponent_one_field()
{
    assert("123e1".as_field().unwrap() == 1230);
}

#[test]
fn value_number_exponent_minus_one_field()
{
    assert("1230e-1".as_field().unwrap() == 123);
}

#[test]
fn value_field_array_value_overflows()
{
    assert("21888242871839275222246405745257275088548364400416034343698204186575808495618".as_field().unwrap() == 1);
}

#[test]
fn value_field_array_with_leading_null()
{
    assert("\0396".as_field().is_none() == true);
}

#[test]
fn value_field_array_with_trailing_null()
{
    assert("396\0".as_field().is_none() == true);
}

#[test]
fn value_field_array_with_mixed_null()
{
    assert("12\034".as_field().is_none() == true);
}

#[test]
unconstrained
fn property_field_three_zero()
{
    assert(JSON::parse(r#"{"a":30}"#).get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_field_minus_three_zero()
{
    assert(JSON::parse(r#"{"a":-30}"#).get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_field_three_zero_e_zero()
{
    assert(JSON::parse(r#"{"a":30e0}"#).get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_zero()
{
    assert(JSON::parse(r#"{"a":-30e0}"#).get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_field_three_zero_e_plus_zero()
{
    assert(JSON::parse(r#"{"a":30e+0}"#).get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_plus_zero()
{
    assert(JSON::parse(r#"{"a":-30e+0}"#).get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_field_three_zero_e_minus_zero()
{
    assert(JSON::parse(r#"{"a":30e-0}"#).get_field("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_minus_zero()
{
    assert(JSON::parse(r#"{"a":-30e-0}"#).get_field("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_field_three_zero_e_one()
{
    assert(JSON::parse(r#"{"a":30e1}"#).get_field("a").unwrap() == 300);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_one()
{
    assert(JSON::parse(r#"{"a":-30e1}"#).get_field("a").unwrap() == -300);
}

#[test]
unconstrained
fn property_field_three_zero_e_plus_one()
{
    assert(JSON::parse(r#"{"a":30e+1}"#).get_field("a").unwrap() == 300);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_plus_one()
{
    assert(JSON::parse(r#"{"a":-30e+1}"#).get_field("a").unwrap() == -300);
}

#[test]
unconstrained
fn property_field_three_zero_e_minus_one()
{
    assert(JSON::parse(r#"{"a":30e-1}"#).get_field("a").unwrap() == 3);
}

#[test]
unconstrained
fn property_field_minus_three_zero_e_minus_one()
{
    assert(JSON::parse(r#"{"a":-30e-1}"#).get_field("a").unwrap() == -3);
}

#[test]
unconstrained
fn property_field_plus_three_zero()
{
    assert(JSON::parse(r#"{"a":+30}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn thirty()
{
    assert(JSON::parse(r#"{"a":"thirty"}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_zero_point_zero()
{
    assert(JSON::parse(r#"{"a":30.0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_minus_three_zero_point_zero()
{
    assert(JSON::parse(r#"{"a":-30.0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_colon_zero()
{
    assert(JSON::parse(r#"{"a":3:0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_space_zero()
{
    assert(JSON::parse(r#"{"a":3 0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_left_brace_zero()
{
    assert(JSON::parse(r#"{"a":3{0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_right_brace_zero()
{
    assert(JSON::parse(r#"{"a":3}0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_quote_zero()
{
    assert(JSON::parse(r#"{"a":3"0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_comma_zero()
{
    assert(JSON::parse(r#"{"a":3,0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_comma_space_zero()
{
    assert(JSON::parse(r#"{"a":3, 0}"#).get_field("a").is_none() == true);
}

#[test]
unconstrained
fn property_field_three_space_comma_zero()
{
    assert(JSON::parse(r#"{"a":3 ,0}"#).get_field("a").is_none() == true);
}

#[test]
fn string_empty_field()
{
    assert(r#""""#.as_field().is_none() == true);
}

#[test]
fn string_one_two_three()
{
    assert(r#""123""#.as_field().unwrap() == 123);
}

#[test]
fn string_minus_one_two_three()
{
    assert(r#""-123""#.as_field().unwrap() == -123);
}

#[test]
fn string_one_two_three_e_one()
{
    assert(r#""123e1""#.as_field().unwrap() == 1230);
}
