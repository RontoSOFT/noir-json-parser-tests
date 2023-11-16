use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_value_array_from_empty_bytes()
{
    let bytes : [u8] = "[ ]".as_bytes().as_slice();

    let result = bytes.as_array().unwrap();

    assert(result.len() == 1);
    assert(result[0].eq_string(" ") == true);
}

#[test]
unconstrained
fn convert_bytes_array_from_literal()
{
    let bytes : [u8] = "true".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_from_number()
{
    let bytes : [u8] = "123".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_from_string()
{
    let bytes : [u8] = "'string'".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_from_object()
{
    let bytes : [u8] = "{}".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_left()
{
    let bytes : [u8] = " []".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_right()
{
    let bytes : [u8] = "[] ".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_bytes_array_malformed_both()
{
    let bytes : [u8] = " [] ".as_bytes().as_slice();

    let result = bytes.as_array();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_value_array_empty()
{
    let result : [ [u8] ] = JSON::parse("[]").doc[0].value.as_array().unwrap();

    assert(result.len() == 1);
    assert(result[0].eq_string("") == true);
}

#[test]
unconstrained
fn convert_value_array_single()
{
    let result : [ [u8] ] = JSON::parse("[1]").doc[0].value.as_array().unwrap();

    assert(result.len() == 1);
    assert(result[0].eq_string("1") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_numbers()
{
    let result : [ [u8] ] = JSON::parse("[1,2,3]").doc[0].value.as_array().unwrap();

    assert(result.len() == 3);
    assert(result[0].eq_string("1") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("3") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_numbers_nested()
{
    let result : [ [u8] ] = JSON::parse("[[1],[2],[3]]").doc[0].value.as_array().unwrap();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = result[0].as_array().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].eq_string("1") == true);

    sub_array = result[1].as_array().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].eq_string("2") == true);

    sub_array = result[2].as_array().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].eq_string("3") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_array_numbers_nested()
{
    let result : [ [u8] ] = JSON::parse("[[1,8],[2,7],[3,6]]").doc[0].value.as_array().unwrap();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = result[0].as_array().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].eq_string("1") == true);
    assert(sub_array[1].eq_string("8") == true);

    sub_array = result[1].as_array().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].eq_string("2") == true);
    assert(sub_array[1].eq_string("7") == true);

    sub_array = result[2].as_array().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].eq_string("3") == true);
    assert(sub_array[1].eq_string("6") == true);
}

#[test]
unconstrained
fn convert_value_array_multiple_mixed_types()
{
    let result : [ [u8] ] = JSON::parse("[true,2,'3']").doc[0].value.as_array().unwrap();

    assert(result.len() == 3);
    assert(result[0].eq_string("true") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("'3'") == true);
}

#[test]
unconstrained
fn convert_property_array_single_number()
{
    let result : [ [u8] ] = JSON::parse("{'a':[1]}").get_array("a").unwrap();

    assert(result.len() == 1);
    assert(result[0].eq_string("1") == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_numbers()
{
    let result : [ [u8] ] = JSON::parse("{'a':[1,2,3]}").get_array("a").unwrap();

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
    let result : [ [u8] ] = JSON::parse("{'a':[true,2,'3',10.35e+5,{}]}").get_array("a").unwrap();

    assert(result.len() == 5);
    assert(result[0].eq_string("true") == true);
    assert(result[1].eq_string("2") == true);
    assert(result[2].eq_string("'3'") == true);
    assert(result[3].eq_string("10.35e+5") == true);
    assert(result[4].eq_array(object_one) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_empty_objects()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{},{},{}]}").get_array("a").unwrap();

    assert(result.len() == 3);
    assert(result[0].eq_array(object_one) == true);
    assert(result[1].eq_array(object_two) == true);
    assert(result[2].eq_array(object_three) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_objects_single_property()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{'a':1},{'a':2}]}").get_array("a").unwrap();

    assert(result.len() == 2);
    assert(result[0].eq_array(object_one) == true);
    assert(result[1].eq_array(object_two) == true);
}

#[test]
unconstrained
fn convert_property_array_multiple_objects_multiple_properties()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}").get_array("a").unwrap();

    assert(result.len() == 2);
    assert(result[0].eq_array(object_one) == true);
    assert(result[1].eq_array(object_two) == true);
}
