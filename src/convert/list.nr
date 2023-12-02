use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_value_array_from_empty_bytes()
{
    let result : [[u8]] = "[ ]".as_list();

    assert(result.len() == 1);
    assert(result[0].eq_string(" ") == true);
}

#[test]
unconstrained
fn convert_bytes_array_from_literal()
{
    assert("true".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_from_number()
{
    assert("123".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_from_string()
{
    assert(r#""string""#.as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_from_object()
{
    assert("{}".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_left()
{
    assert(" []".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_right()
{
    assert("[] ".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_both()
{
    assert(" [] ".as_list().len() == 0);
}

#[test]
unconstrained
fn convert_value_array_empty()
{
    let result : [[u8]] = "[]".as_list();

    assert(result.len() == 1);
    assert(result[0].eq_string("") == true);
}

#[test]
unconstrained
fn convert_value_array_single()
{
    let result : [[u8]] = "[1]".as_list();

    assert(result.len() == 1);
    assert(result[0].eq_string("1") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_numbers()
{
    let result : [[u8]] = "[1,2,3]".as_list();

    assert(result.len() == 3);
    assert(result[0].eq_string("1") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("3") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_numbers_nested()
{
    let result : [[u8]] = "[[1],[2],[3]]".as_list();

    assert(result.len() == 3);

    let sub_array_1 : [[u8]] = result[0].as_list();
    assert(sub_array_1.len() == 1);
    assert(sub_array_1[0].eq_string("1") == true);

    let sub_array_2 : [[u8]] = result[1].as_list();
    assert(sub_array_2.len() == 1);
    assert(sub_array_2[0].eq_string("2") == true);

    let sub_array_3 : [[u8]] = result[2].as_list();
    assert(sub_array_3.len() == 1);
    assert(sub_array_3[0].eq_string("3") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_array_numbers_nested()
{
    let result : [[u8]] = "[[1,8],[2,7],[3,6]]".as_list();

    assert(result.len() == 3);

    let sub_array_1 : [[u8]] = result[0].as_list();
    assert(sub_array_1.len() == 2);
    assert(sub_array_1[0].eq_string("1") == true);
    assert(sub_array_1[1].eq_string("8") == true);

    let sub_array_2 : [[u8]] = result[1].as_list();
    assert(sub_array_2.len() == 2);
    assert(sub_array_2[0].eq_string("2") == true);
    assert(sub_array_2[1].eq_string("7") == true);

    let sub_array_3 : [[u8]] = result[2].as_list();
    assert(sub_array_3.len() == 2);
    assert(sub_array_3[0].eq_string("3") == true);
    assert(sub_array_3[1].eq_string("6") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_mixed_types()
{
    let result : [[u8]] = r#"[true,2,"3"]"#.as_list();

    assert(result.len() == 3);
    assert(result[0].eq_string("true") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string(r#""3""#) == true);
}

#[test]
unconstrained
fn convert_property_array_single_number()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[1]}"#).get_array("a");

    assert(result.len() == 1);
    assert(result[0].eq_string("1") == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_numbers()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[1,2,3]}"#).get_array("a");

    assert(result.len() == 3);
    assert(result[0].eq_string("1") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("3") == true);
}

global object_one   : [u8; 3] = [0x7B, 0x00, 0x7D];
global object_two   : [u8; 3] = [0x7B, 0x01, 0x7D];
global object_three : [u8; 3] = [0x7B, 0x02, 0x7D];

#[test]
unconstrained
fn convert_property_array_multiple_mixed_types()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[true,2,"3",10.35e+5,{}]}"#).get_array("a");

    assert(result.len() == 5);
    assert(result[0].eq_string("true") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string(r#""3""#) == true);
    assert(result[3].eq_string("10.35e+5") == true);
    assert(result[4].eq(object_one) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_empty_objects()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[{},{},{}]}"#).get_array("a");

    assert(result.len() == 3);
    assert(result[0].eq(object_one) == true);
    assert(result[1].eq(object_two) == true);
    assert(result[2].eq(object_three) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_objects_single_property()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[{"a":1},{"a":2}]}"#).get_array("a");

    assert(result.len() == 2);
    assert(result[0].eq(object_one) == true);
    assert(result[1].eq(object_two) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_objects_multiple_properties()
{
    let result : [[u8]] = JSON::parse(r#"{"a":[{"a":1,"b":true,"c":"123"},{"a":2,"b":false,"c":"456"}]}"#).get_array("a");

    assert(result.len() == 2);
    assert(result[0].eq(object_one) == true);
    assert(result[1].eq(object_two) == true);
}

#[test]
unconstrained
fn convert_string_empty_array()
{
    assert(JSON::parse(r#""""#).get_array("").len() == 0);
}

#[test]
unconstrained
fn convert_string_array_empty()
{
    assert(JSON::parse(r#""[]""#).get_array("").len() == 1);
}

#[test]
unconstrained
fn convert_string_array_one_two_three()
{
    let result : [[u8]] = JSON::parse(r#""[1,2,3]""#).get_array("");

    assert(result.len() == 3);
    assert(result[0].eq_string("1") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("3") == true);
}

#[test]
unconstrained
fn convert_string_array_true_two_string_three()
{
    let result : [[u8]] = JSON::parse(r#""[true,2,\"3\"]""#).get_array("");

    assert(result.len() == 3);
    assert(result[0].eq_string("true") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string(r#""3""#) == true);
}
