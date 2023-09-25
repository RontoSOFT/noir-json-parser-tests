use dep::rontosoft::parse::JSON;
use dep::rontosoft::convert::asBool;
use dep::rontosoft::convert::asField;
use dep::rontosoft::convert::asInteger;

#[test]
fn two_properties_number()
{
    let json = JSON::new("{'a' : 5, 'b' : 3}");

    let (key, value) = ("a", "5");

    let kvp = json.get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());

    let (key2, value2) = ("b", "3");

    let kvp2 = json.get(key2);

    assert(kvp2.key == key2.as_bytes());
    assert(kvp2.value == value2.as_bytes());
}

#[test]
fn two_properties_string_and_number()
{
    let json = JSON::new("{'a' : '5', 'b' : 3}");

    let (key, value) = ("a", "'5'");

    let kvp = json.get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());

    let (key2, value2) = ("b", "3");

    let kvp2 = json.get(key2);

    assert(kvp2.key == key2.as_bytes());
    assert(kvp2.value == value2.as_bytes());
}

#[test]
fn two_properties_string_and_string()
{
    let json = JSON::new("{'a' : '5', 'b' : '3'}");

    let (key, value) = ("a", "'5'");

    let kvp = json.get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());

    let (key2, value2) = ("b", "'3'");

    let kvp2 = json.get(key2);

    assert(kvp2.key == key2.as_bytes());
    assert(kvp2.value == value2.as_bytes());
}

#[test]
fn two_properties_same_name_replace_property()
{
    let (key, value) = ("a", "3");

    let kvp = JSON::new("{'a' : 5, 'a' : 3}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
unconstrained fn two_properties_same_name_replace_property_check_length()
{
    let (key, value) = ("a", "3");
    let bytes = "{'a' : 5, 'a' : 3}".as_bytes();
    let json = dep::rontosoft::parse::parse(bytes);

    assert(json.len() == 1);
    assert(json[0].key[0] == key.as_bytes()[0]);
    assert(json[0].value[0] == value.as_bytes()[0]);
}

#[test]
fn three_properties_unique_values()
{
    let json = JSON::new("{'name':'John Doe','age':30,'isEmployed':true}"); //, 'fivehundred':500, 'somelongpropnameasstring' : 'stringtest123' }");

    let (key, value) = ("name", "'John Doe'");

    let kvp = json.get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());

    let (key2, value2) = ("age", "30");

    let kvp2 = json.get(key2);

    assert(kvp2.key == key2.as_bytes());
    assert(kvp2.value == value2.as_bytes());
    assert(asField(kvp2.value).unwrap_unchecked() == 30);
    assert(asInteger(kvp2.value).unwrap_unchecked() == 30);

    let (key3, value3) = ("isEmployed", "true");

    let kvp3 = json.get(key3);

    assert(kvp3.key == key3.as_bytes());
    assert(kvp3.value == value3.as_bytes());
    assert(asBool(kvp3.value).unwrap_unchecked() == true);
}
