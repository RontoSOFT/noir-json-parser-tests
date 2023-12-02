use dep::rontosoft::JSON;

#[test]
fn number_as_bool()
{
    assert("123".as_bool().is_none() == true);
}

#[test]
fn string_as_bool()
{
    assert(r#""string""#.as_bool().is_none() == true);
}

#[test]
fn array_as_bool()
{
    assert("[]".as_bool().is_none() == true);
}

#[test]
fn object_as_bool()
{
    assert("{}".as_bool().is_none() == true);
}

#[test]
fn space_as_bool()
{
    assert(" ".as_bool().is_none() == true);
}

#[test]
fn empty_as_bool()
{
    assert("".as_bool().is_none() == true);
}

#[test]
fn value_literal_true()
{
    assert("true".as_bool().unwrap() == true);
}

#[test]
fn value_literal_null()
{
    assert("null".as_bool().unwrap() == false);
}

#[test]
fn value_literal_false()
{
    assert("false".as_bool().unwrap() == false);
}

#[test]
unconstrained
fn propery_literal_true()
{
    assert(JSON::parse(r#"{"a":true}"#).get_bool("a").unwrap() == true);
}

#[test]
unconstrained
fn propery_literal_null()
{
    assert(JSON::parse(r#"{"a":null}"#).get_bool("a").unwrap() == false);
}

#[test]
unconstrained
fn propery_literal_false()
{
    assert(JSON::parse(r#"{"a":false}"#).get_bool("a").unwrap() == false);
}

#[test]
fn string_empty_bool()
{
    assert(r#""""#.as_bool().is_none() == true);
}

#[test]
unconstrained
fn string_null()
{
    assert(r#""null""#.as_bool().unwrap() == false);
}

#[test]
unconstrained
fn string_true()
{
    assert(r#""true""#.as_bool().unwrap() == true);
}

#[test]
fn string_false()
{
    assert(r#""false""#.as_bool().unwrap() == false);
}

#[test]
fn tru_as_bool()
{
    assert("tru".as_bool().is_none() == true);
}

#[test]
fn fals_as_bool()
{
    assert("fals".as_bool().is_none() == true);
}

#[test]
fn string_tru_as_bool()
{
    assert(r#""tru""#.as_bool().is_none() == true);
}

#[test]
fn string_fals_as_bool()
{
    assert(r#""fals""#.as_bool().is_none() == true);
}
