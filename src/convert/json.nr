use dep::rontosoft::JSON;

#[test]
unconstrained
fn empty_string()
{
    assert("\"\"".as_json().is_none() == true);
}

#[test]
unconstrained
fn empty_object()
{
    assert("\"{}\"".as_json().is_empty() == true);
}

#[test]
unconstrained
fn empty_object_with_space()
{
    assert("\"{ }\"".as_json().is_empty() == true);
}

#[test]
unconstrained
fn object()
{
    assert(r#""{"a":1}""#.as_json().get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_object()
{
    assert(r#""{"a":{"b":1}}""#.as_json().get_object("a").get("b").eq_string("1") == true);
}

#[test]
unconstrained
fn object_one_key_value_object()
{
    let json = JSON::parse(r#"{"abc":{"a":1,"b":true,"c":"123"}}"#);

    let obj = json.get_object("abc");
    assert(obj.get("a").eq_string("1") == true);
    assert(obj.get("b").eq_string("true") == true);
    assert(obj.get("c").eq_string("\"123\"") == true);
}

#[test]
unconstrained
fn object_two_keys_with_objects_with_multiple_keys()
{
    let json = JSON::parse(r#"{"abc":{"a":1,"b":true,"c":"123"},"def":{"a":2,"b":false,"c":"456"}}"#);

    let obj_1 = json.get_object("abc");
    assert(obj_1.get("a").eq_string("1") == true);
    assert(obj_1.get("b").eq_string("true") == true);
    assert(obj_1.get("c").eq_string("\"123\"") == true);

    let obj_2 = json.get_object("def");
    assert(obj_2.get("a").eq_string("2") == true);
    assert(obj_2.get("b").eq_string("false") == true);
    assert(obj_2.get("c").eq_string("\"456\"") == true);
}

#[test]
unconstrained
fn object_two_keys_with_nested_objects()
{
    let json = JSON::parse(r#"{"abc":{"a":{"b":1}},"def":{"d":{"e":2}}}"#);

    assert(json.get_object("abc").get_object("a").get("b").eq_string("1") == true);
    assert(json.get_object("def").get_object("d").get("e").eq_string("2") == true);
}

#[test]
unconstrained
fn object_two_keys_with_twice_nested_objects()
{
    let json = JSON::parse(r#"{"abc":{"a":{"b":{"c":1}}},"def":{"d":{"e":{"f":2}}}}"#);

    assert(json.get_object("abc").get_object("a").get_object("b").get("c").eq_string("1") == true);
    assert(json.get_object("def").get_object("d").get_object("e").get("f").eq_string("2") == true);
}

#[test]
unconstrained
fn object_array_two_objects_with_multiple_keys()
{
    let json = JSON::parse(r#"{"abc":[{"a":1,"b":true,"c":"123"},{"a":2,"b":false,"c":"456"}]}"#);
    let array : [[u8]] = json.get_array("abc");

    let obj_1 = json.child(array[0][1]);
    assert(obj_1.get("a").eq_string("1") == true);
    assert(obj_1.get("b").eq_string("true") == true);
    assert(obj_1.get("c").eq_string("\"123\"") == true);

    let obj_2 = json.child(array[1][1]);
    assert(obj_2.get("a").eq_string("2") == true);
    assert(obj_2.get("b").eq_string("false") == true);
    assert(obj_2.get("c").eq_string("\"456\"") == true);
}
