use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_value_literal_true_as_bool()
{
    assert(JSON::parse("true").doc[0].value.asBool().unwrap() == true);
}

#[test]
unconstrained
fn convert_value_literal_null_as_bool()
{
    assert(JSON::parse("null").doc[0].value.asBool().unwrap() == false);
}

#[test]
unconstrained
fn convert_value_literal_false_as_bool()
{
    assert(JSON::parse("false").doc[0].value.asBool().unwrap() == false);
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
