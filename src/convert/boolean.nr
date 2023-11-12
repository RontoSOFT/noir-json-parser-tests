use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_number_as_bool()
{
    let bytes : [u8] = "123".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_string_as_bool()
{
    let bytes : [u8] = "'string'".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_array_as_bool()
{
    let bytes : [u8] = "[]".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_object_as_bool()
{
    let bytes : [u8] = "{}".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_space_as_bool()
{
    let bytes : [u8] = " ".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_empty_as_bool()
{
    let bytes : [u8] = "".as_bytes().as_slice();

    let result = bytes.as_bool();
    assert(result.is_none() == true);
}

#[test]
unconstrained
fn convert_value_literal_true()
{
    assert(JSON::parse("true").get_bool("").unwrap() == true);
}

#[test]
unconstrained
fn convert_value_literal_null()
{
    assert(JSON::parse("null").get_bool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_value_literal_false()
{
    assert(JSON::parse("false").get_bool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_true()
{
    assert(JSON::parse("{'a':true}").get_bool("a").unwrap() == true);
}

#[test]
unconstrained
fn convert_propery_literal_null()
{
    assert(JSON::parse("{'a':null}").get_bool("a").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_false()
{
    assert(JSON::parse("{'a':false}").get_bool("a").unwrap() == false);
}
