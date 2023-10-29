use dep::rontosoft::JSON;

#[test]
unconstrained
fn array_single_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[1]").doc[0].value.asSlice().unwrap();

    assert(result.len() == 1);
    assert(result[0].asField().unwrap() == 1);
}

#[test]
unconstrained
fn array_multiple_numbers_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[1,2,3]").doc[0].value.asSlice().unwrap();

    assert(result.len() == 3);
    assert(result[0].asField().unwrap() == 1);
    assert(result[1].asField().unwrap() == 2);
    assert(result[2].asField().unwrap() == 3);
}

#[test]
unconstrained
fn array_multiple_numbers_nested_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[[1],[2],[3]]").doc[0].value.asSlice().unwrap();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = result[0].asSlice().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].asField().unwrap() == 1);

    sub_array = result[1].asSlice().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].asField().unwrap() == 2);

    sub_array = result[2].asSlice().unwrap();
    assert(sub_array.len() == 1);
    assert(sub_array[0].asField().unwrap() == 3);
}

#[test]
unconstrained
fn array_multiple_array_numbers_nested_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[[1,8],[2,7],[3,6]]").doc[0].value.asSlice().unwrap();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = result[0].asSlice().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].asField().unwrap() == 1);
    assert(sub_array[1].asField().unwrap() == 8);

    sub_array = result[1].asSlice().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].asField().unwrap() == 2);
    assert(sub_array[1].asField().unwrap() == 7);

    sub_array = result[2].asSlice().unwrap();
    assert(sub_array.len() == 2);
    assert(sub_array[0].asField().unwrap() == 3);
    assert(sub_array[1].asField().unwrap() == 6);
}

#[test]
unconstrained
fn array_multiple_mixed_types_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[true,2,'3']").doc[0].value.asSlice().unwrap();

    assert(result.len() == 3);
    assert(result[0].asBool().unwrap() == true);
    assert(result[1].asField().unwrap() == 2);
    assert(result[2].eq_string("'3'") == true);
}

#[test]
unconstrained
fn property_array_single_number_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[1]}").getSlice("a").unwrap();

    assert(result.len() == 1);
    assert(result[0].asField().unwrap() == 1);
}

#[test]
unconstrained
fn property_array_multiple_numbers_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[1,2,3]}").getSlice("a").unwrap();

    assert(result.len() == 3);
    assert(result[0].asField().unwrap() == 1);
    assert(result[1].asField().unwrap() == 2);
    assert(result[2].asField().unwrap() == 3);
}

#[test]
unconstrained
fn property_array_multiple_mixed_types_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[true,2,'3',10.35e+5,{}]}").getSlice("a").unwrap();

    assert(result.len() == 5);
    assert(result[0].asBool().unwrap() == true);
    assert(result[1].asField().unwrap() == 2);
    assert(result[2].eq_string("'3'") == true);
    assert(result[3].eq_string("10.35e+5") == true);
    assert(result[4].eq_string("{}") == true);
}

#[test]
unconstrained
fn property_array_multiple_empty_objects_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{},{},{}]}").getSlice("a").unwrap();

    assert(result.len() == 3);
    assert(result[0].eq_string("{}") == true);
    assert(result[1].eq_string("{}") == true);
    assert(result[2].eq_string("{}") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_single_property_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{'a':1},{'a':2}]}").getSlice("a").unwrap();

    assert(result.len() == 2);
    assert(result[0].eq_string("{'a':1}") == true);
    assert(result[1].eq_string("{'a':2}") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_multiple_properties_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}").getSlice("a").unwrap();

    assert(result.len() == 2);
    assert(result[0].eq_string("{'a':1,'b':true,'c':'123'}") == true);
    assert(result[1].eq_string("{'a':2,'b':false,'c':'456'}") == true);
}
