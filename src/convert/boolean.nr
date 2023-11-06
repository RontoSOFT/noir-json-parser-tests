use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_value_literal_true_as_bool()
{
    assert(JSON::parse("true").get_bool("").unwrap() == true);
}

#[test]
unconstrained
fn convert_value_literal_null_as_bool()
{
    assert(JSON::parse("null").get_bool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_value_literal_false_as_bool()
{
    assert(JSON::parse("false").get_bool("").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_true_as_bool()
{
    assert(JSON::parse("{'a':true}").get_bool("a").unwrap() == true);
}

#[test]
unconstrained
fn convert_propery_literal_null_as_bool()
{
    assert(JSON::parse("{'a':null}").get_bool("a").unwrap() == false);
}

#[test]
unconstrained
fn convert_propery_literal_false_as_bool()
{
    assert(JSON::parse("{'a':false}").get_bool("a").unwrap() == false);
}
