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
    let result : [ [u8] ] = JSON::parse("{'a':[true,2,'3']}").getSlice("a").unwrap();

    assert(result.len() == 3);
    assert(result[0].asBool().unwrap() == true);
    assert(result[1].asField().unwrap() == 2);
    assert(result[2].eq_string("'3'") == true);
}
