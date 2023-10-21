use dep::rontosoft::JSON;

#[test]
unconstrained
fn two_properties_number()
{
    let json = JSON::parse("{'a' : 5, 'b' : 3}");

    let value = "5";
    assert(json.bytesOf("a").unwrap_unchecked().eq_string(value) == true);

    let value2 = "3";
    assert(json.bytesOf("b").unwrap_unchecked().eq_string(value2) == true);
}

#[test]
unconstrained
fn two_properties_string_and_number()
{
    let json = JSON::parse("{'a' : '5', 'b' : 3}");

    let value = "'5'";
    assert(json.bytesOf("a").unwrap_unchecked().eq_string(value) == true);

    let value2 = "3";
    assert(json.bytesOf("b").unwrap_unchecked().eq_string(value2) == true);
}

#[test]
unconstrained
fn two_properties_string_and_string()
{
    let json = JSON::parse("{'a' : '5', 'b' : '3'}");

    let value = "'5'";
    assert(json.bytesOf("a").unwrap_unchecked().eq_string(value) == true);

    let value2 = "'3'";
    assert(json.bytesOf("b").unwrap_unchecked().eq_string(value2) == true);
}

#[test]
unconstrained
fn two_properties_same_name_replace_property()
{
    assert(JSON::parse("{'a' : 5, 'a' : 3}").bytesOf("a").unwrap_unchecked().eq_string("3") == true);
}

#[test]
unconstrained
fn three_properties_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}"); //, 'fivehundred':500, 'somelongpropnameasstring' : 'stringtest123' }");

    let (key, value) = ("name", "'John Doe'");
    assert(json.bytesOf(key).unwrap_unchecked().eq_string(value) == true);

    let (key2, value2) = ("age", "30");
    let bytes2 = json.bytesOf(key2).unwrap_unchecked();
    assert(bytes2.eq_string(value2) == true);
    assert(bytes2.asField().unwrap_unchecked() == 30);

    let (key3, value3) = ("isEmployed", "true");
    let bytes3 = json.bytesOf(key3).unwrap_unchecked();
    assert(bytes3.eq_string(value3) == true);
    assert(bytes3.asBool().unwrap_unchecked());
}

#[test]
unconstrained
fn two_properties_same_name_replace_property_check_length()
{
    let (key, value) = ("a", "3");
    let json = dep::rontosoft::JSON::parse("{'a' : 5, 'a' : 3}");

    assert(json.doc.len() == 1);
    assert(json.doc[0].key.eq_string(key));
    assert(json.doc[0].value.eq_string(value));
}
