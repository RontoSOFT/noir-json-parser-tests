use dep::rontosoft::JSON;

#[test]
fn convert_number_as_bool()
{
    assert("123".as_bool().is_none() == true);
}

#[test]
fn convert_string_as_bool()
{
    assert(r#""string""#.as_bool().is_none() == true);
}

#[test]
fn convert_array_as_bool()
{
    assert("[]".as_bool().is_none() == true);
}

#[test]
fn convert_object_as_bool()
{
    assert("{}".as_bool().is_none() == true);
}

#[test]
fn convert_space_as_bool()
{
    assert(" ".as_bool().is_none() == true);
}

#[test]
fn convert_empty_as_bool()
{
    assert("".as_bool().is_none() == true);
}

#[test]
fn convert_value_literal_true()
{
    assert("true".as_bool().unwrap() == true);
}

#[test]
fn convert_value_literal_null()
{
    assert("null".as_bool().unwrap() == false);
}

#[test]
fn convert_value_literal_false()
{
    assert("false".as_bool().unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_true()
{
    assert(JSON::parse(r#"{"a":true}"#).get_bool("a").unwrap() == true);
}

#[test]
unconstrained
fn convert_propery_literal_null()
{
    assert(JSON::parse(r#"{"a":null}"#).get_bool("a").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_false()
{
    assert(JSON::parse(r#"{"a":false}"#).get_bool("a").unwrap() == false);
}

#[test]
fn convert_string_empty_bool()
{
    assert(r#""""#.as_bool().is_none() == true);
}

#[test]
unconstrained
fn convert_string_null()
{
    assert(r#""null""#.as_bool().unwrap() == false);
}

#[test]
unconstrained
fn convert_string_true()
{
    assert(r#""true""#.as_bool().unwrap() == true);
}

#[test]
fn convert_string_false()
{
    assert(r#""false""#.as_bool().unwrap() == false);
}

#[test]
fn convert_tru_as_bool()
{
    assert("tru".as_bool().is_none() == true);
}

#[test]
fn convert_fals_as_bool()
{
    assert("fals".as_bool().is_none() == true);
}

#[test]
fn convert_string_tru_as_bool()
{
    assert(r#""tru""#.as_bool().is_none() == true);
}

#[test]
fn convert_string_fals_as_bool()
{
    assert(r#""fals""#.as_bool().is_none() == true);
}
