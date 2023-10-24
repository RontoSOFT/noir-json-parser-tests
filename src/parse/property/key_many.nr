use dep::rontosoft::JSON;

#[test]
unconstrained
fn two_keys_number()
{
    let json = JSON::parse("{'a' : 5, 'b' : 3}");

    assert(json.bytesOf("a").unwrap().eq_string("5") == true);
    assert(json.bytesOf("b").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn two_keys_string_and_number()
{
    let json = JSON::parse("{'a' : '5', 'b' : 3}");

    assert(json.bytesOf("a").unwrap().eq_string("'5'") == true);
    assert(json.bytesOf("b").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn two_keys_string_and_string()
{
    let json = JSON::parse("{'a' : '5', 'b' : '3'}");

    assert(json.bytesOf("a").unwrap().eq_string("'5'") == true);
    assert(json.bytesOf("b").unwrap().eq_string("'3'") == true);
}

#[test]
unconstrained
fn two_keys_same_name_replace_property()
{
    assert(JSON::parse("{'a' : 5, 'a' : 3}").bytesOf("a").unwrap().eq_string("3") == true);
}

#[test]
unconstrained
fn three_keys_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}"); //, 'fivehundred':500, 'somelongpropnameasstring' : 'stringtest123' }");

    let (key, value) = ("name", "'John Doe'");
    assert(json.bytesOf(key).unwrap().eq_string(value) == true);

    let (key2, value2) = ("age", "30");
    let bytes2 = json.bytesOf(key2).unwrap();
    assert(bytes2.eq_string(value2) == true);
    assert(bytes2.asField().unwrap() == 30);

    let (key3, value3) = ("isEmployed", "true");
    let bytes3 = json.bytesOf(key3).unwrap();
    assert(bytes3.eq_string(value3) == true);
    assert(bytes3.asBool().unwrap() == true);
}

#[test]
unconstrained
fn two_keys_same_name_replace_property_check_length()
{
    let (key, value) = ("a", "3");
    let json = dep::rontosoft::JSON::parse("{'a' : 5, 'a' : 3}");

    assert(json.doc.len() == 1);
    assert(json.doc[0].key.eq_string(key));
    assert(json.doc[0].value.eq_string(value));
}
