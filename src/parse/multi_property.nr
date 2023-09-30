use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;
use dep::rontosoft::convert_::asBool;
use dep::rontosoft::convert_::asField;
use dep::rontosoft::convert_::asInteger;

#[test]
unconstrained
fn two_properties_number()
{
    let json = JSON::parse("{'a' : 5, 'b' : 3}");

    let (key, value) = ("a", "5");

    let bytes = json.bytesOf(key).unwrap_unchecked();
    assert(slice_eq_array(bytes, value.as_bytes()));

    let (key2, value2) = ("b", "3");

    let bytes2 = json.bytesOf(key2).unwrap_unchecked();
    assert(slice_eq_array(bytes2, value2.as_bytes()));
}

#[test]
unconstrained
fn two_properties_string_and_number()
{
    let json = JSON::parse("{'a' : '5', 'b' : 3}");

    let (key, value) = ("a", "'5'");

    let bytes = json.bytesOf(key).unwrap_unchecked();
    assert(slice_eq_array(bytes, value.as_bytes()));

    let (key2, value2) = ("b", "3");

    let bytes2 = json.bytesOf(key2).unwrap_unchecked();
    assert(slice_eq_array(bytes2, value2.as_bytes()));
}

#[test]
unconstrained
fn two_properties_string_and_string()
{
    let json = JSON::parse("{'a' : '5', 'b' : '3'}");

    let (key, value) = ("a", "'5'");

    let bytes = json.bytesOf(key).unwrap_unchecked();
    assert(slice_eq_array(bytes, value.as_bytes()));

    let (key2, value2) = ("b", "'3'");

    let bytes2 = json.bytesOf(key2).unwrap_unchecked();
    assert(slice_eq_array(bytes2, value2.as_bytes()));
}

#[test]
unconstrained
fn two_properties_same_name_replace_property()
{
    let bytes = JSON::parse("{'a' : 5, 'a' : 3}").bytesOf("a").unwrap_unchecked();

    assert(slice_eq_array(bytes, "3".as_bytes()));
}

#[test]
unconstrained
fn three_properties_unique_values()
{
    let json = JSON::parse("{'name':'John Doe','age':30,'isEmployed':true}"); //, 'fivehundred':500, 'somelongpropnameasstring' : 'stringtest123' }");

    let (key, value) = ("name", "'John Doe'");
    let bytes = json.bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()));

    let (key2, value2) = ("age", "30");
    let bytes2 = json.bytesOf(key2).unwrap_unchecked();

    assert(slice_eq_array(bytes2, value2.as_bytes()));
    assert(asField(bytes2).unwrap_unchecked() == 30);
    assert(asInteger(bytes2).unwrap_unchecked() == 30);

    let (key3, value3) = ("isEmployed", "true");
    let bytes3 = json.bytesOf(key3).unwrap_unchecked();

    assert(slice_eq_array(bytes3, value3.as_bytes()));
    assert(asBool(bytes3).unwrap_unchecked());
}

#[test]
unconstrained
fn two_properties_same_name_replace_property_check_length()
{
    let (key, value) = ("a", "3");
    let bytes = "{'a' : 5, 'a' : 3}".as_bytes();
    let json = dep::rontosoft::parse::parse(bytes);

    assert(json.len() == 1);
    assert(json[0].key[0] == key.as_bytes()[0]);
    assert(json[0].value[0] == value.as_bytes()[0]);
}
