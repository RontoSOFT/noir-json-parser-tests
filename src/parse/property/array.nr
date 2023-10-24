use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_array_as_value_single_number()
{
    let value = "[1]";
    assert(JSON::parse("{'a':[1]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_single_number_nested()
{
    let value = "[[1]]";
    assert(JSON::parse("{'a':[[1]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple()
{
    let value = "[1,2,3]";
    assert(JSON::parse("{'a':[1,2,3]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple_nested()
{
    let value = "[[1],[2],[3]]";
    assert(JSON::parse("{'a':[[1],[2],[3]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_strings()
{
    let value = "['1','2','3']";
    assert(JSON::parse("{'a':['1','2','3']}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_mixed_types()
{
    let value = "[1,'2',true]";
    assert(JSON::parse("{'a':[1,'2',true]}").bytesOf("a").unwrap().eq_string(value) == true);
}
