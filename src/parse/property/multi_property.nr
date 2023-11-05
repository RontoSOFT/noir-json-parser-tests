use dep::rontosoft::JSON;

#[test]
unconstrained
fn two_properties_number()
{
    let json = JSON::parse("{'a' : 5, 'b' : 3}");

    assert(json.bytesOf("a").unwrap().eq_string("5") == true);
    assert(json.bytesOf("b").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn two_properties_string_and_number()
{
    let json = JSON::parse("{'a' : '5', 'b' : 3}");

    assert(json.bytesOf("a").unwrap().eq_string("'5'") == true);
    assert(json.bytesOf("b").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn two_properties_string_and_string()
{
    let json = JSON::parse("{'a' : '5', 'b' : '3'}");

    assert(json.bytesOf("a").unwrap().eq_string("'5'") == true);
    assert(json.bytesOf("b").unwrap().eq_string("'3'") == true);
}

#[test]
unconstrained
fn two_properties_same_name_replace_property()
{
    assert(JSON::parse("{'a' : 5, 'a' : 3}").bytesOf("a").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn three_properties_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}");

    assert(json.bytesOf("name").unwrap().eq_string("'John Doe'") == true);
    assert(json.bytesOf("age").unwrap().eq_string("30") == true);
    assert(json.bytesOf("isEmployed").unwrap().eq_string("true") == true);
}
