use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn array_single_number()
{
    let value = "[1]";
    let bytes = JSON::parse("[1]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_single_number_nested()
{
    let value = "[[1]]";
    let bytes = JSON::parse("[[1]]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_multiple_numbers()
{
    let value = "[1,2,3]";
    let bytes = JSON::parse("[1,2,3]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_multiple_numbers_nested()
{
    let value = "[[1],[2],[3]]";
    let bytes = JSON::parse("[[1],[2],[3]]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_multiple_array_numbers_nested()
{
    let value = "[[1,1],[2,2],[3,3]]";
    let bytes = JSON::parse("[[1,1],[2,2],[3,3]]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_as_value_multiple_strings()
{
    let value = "['1','2','3']";
    let bytes = JSON::parse("['1','2','3']").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn array_as_value_multiple_mixed_types()
{
    let value = "[1,'2',true]";
    let bytes = JSON::parse("[1,'2',true]").doc[0].value;

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_single_number()
{
    let (key, value) = ("a", "[1]");
    let bytes = JSON::parse("{'a':[1]}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_single_number_nested()
{
    let (key, value) = ("a", "[[1]]");
    let bytes = JSON::parse("{'a':[[1]]}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple()
{
    let (key, value) = ("a", "[1,2,3]");
    let bytes = JSON::parse("{'a':[1,2,3]}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple_nested()
{
    let (key, value) = ("a", "[[1],[2],[3]]");
    let bytes = JSON::parse("{'a':[[1],[2],[3]]}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_strings()
{
    let (key, value) = ("a", "['1','2','3']");
    let bytes = JSON::parse("{'a':['1','2','3']}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_mixed_types()
{
    let (key, value) = ("a", "[1,'2',true]");
    let bytes = JSON::parse("{'a':[1,'2',true]}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}
