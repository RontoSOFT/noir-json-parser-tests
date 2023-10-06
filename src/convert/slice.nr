use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;
use dep::rontosoft::convert::asBool;
use dep::rontosoft::convert::asField;
use dep::rontosoft::convert::asSlice;

#[test]
unconstrained
fn array_single_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[1]").getSlice("").unwrap_unchecked();

    assert(result.len() == 1);
    assert(asField(result[0]).unwrap_unchecked() == 1);
}

#[test]
unconstrained
fn array_multiple_numbers_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[1,2,3]").getSlice("").unwrap_unchecked();

    assert(result.len() == 3);
    assert(asField(result[0]).unwrap_unchecked() == 1);
    assert(asField(result[1]).unwrap_unchecked() == 2);
    assert(asField(result[2]).unwrap_unchecked() == 3);
}

#[test]
unconstrained
fn array_multiple_numbers_nested_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[[1],[2],[3]]").getSlice("").unwrap_unchecked();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = asSlice(result[0]).unwrap_unchecked();
    assert(sub_array.len() == 1);
    assert(asField(sub_array[0]).unwrap_unchecked() == 1);

    sub_array = asSlice(result[1]).unwrap_unchecked();
    assert(sub_array.len() == 1);
    assert(asField(sub_array[0]).unwrap_unchecked() == 2);

    sub_array = asSlice(result[2]).unwrap_unchecked();
    assert(sub_array.len() == 1);
    assert(asField(sub_array[0]).unwrap_unchecked() == 3);
}

#[test]
unconstrained
fn array_multiple_array_numbers_nested_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[[1,8],[2,7],[3,6]]").getSlice("").unwrap_unchecked();

    assert(result.len() == 3);

    let mut sub_array : [ [u8] ] = asSlice(result[0]).unwrap_unchecked();
    assert(sub_array.len() == 2);
    assert(asField(sub_array[0]).unwrap_unchecked() == 1);
    assert(asField(sub_array[1]).unwrap_unchecked() == 8);

    sub_array = asSlice(result[1]).unwrap_unchecked();
    assert(sub_array.len() == 2);
    assert(asField(sub_array[0]).unwrap_unchecked() == 2);
    assert(asField(sub_array[1]).unwrap_unchecked() == 7);

    sub_array = asSlice(result[2]).unwrap_unchecked();
    assert(sub_array.len() == 2);
    assert(asField(sub_array[0]).unwrap_unchecked() == 3);
    assert(asField(sub_array[1]).unwrap_unchecked() == 6);
}

#[test]
unconstrained
fn array_multiple_mixed_types_as_slice()
{
    let result : [ [u8] ] = JSON::parse("[true,2,'3']").getSlice("").unwrap_unchecked();

    assert(result.len() == 3);
    assert(asBool(result[0]).unwrap_unchecked() == true);
    assert(asField(result[1]).unwrap_unchecked() == 2);
    assert(slice_eq_array(result[2], "'3'".as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_multiple_numbers_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[1,2,3]}").getSlice("a").unwrap_unchecked();

    assert(result.len() == 3);
    assert(asField(result[0]).unwrap_unchecked() == 1);
    assert(asField(result[1]).unwrap_unchecked() == 2);
    assert(asField(result[2]).unwrap_unchecked() == 3);
}

#[test]
unconstrained
fn property_array_multiple_mixed_types_as_slice()
{
    let result : [ [u8] ] = JSON::parse("{'a':[true,2,'3']}").getSlice("a").unwrap_unchecked();

    assert(result.len() == 3);
    assert(asBool(result[0]).unwrap_unchecked() == true);
    assert(asField(result[1]).unwrap_unchecked() == 2);
    assert(slice_eq_array(result[2], "'3'".as_bytes()) == true);
}
