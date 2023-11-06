use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_value_literal_true_as_bool()
{
    assert(JSON::parse("true").getBool("").unwrap() == true);
}

#[test]
unconstrained
fn convert_value_literal_null_as_bool()
{
    assert(JSON::parse("null").getBool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_value_literal_false_as_bool()
{
    assert(JSON::parse("false").getBool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_true_as_bool()
{
    assert(JSON::parse("{'a':true}").getBool("a").unwrap() == true);
}

#[test]
unconstrained
fn convert_propery_literal_null_as_bool()
{
    assert(JSON::parse("{'a':null}").getBool("a").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_false_as_bool()
{
    assert(JSON::parse("{'a':false}").getBool("a").unwrap() == false);
}
