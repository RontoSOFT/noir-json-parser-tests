use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_literal_null()
{
    let value = "null";
    assert(JSON::parse("{'a':null}").bytesOf("a").unwrap_unchecked().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_true()
{
    let value = "true";
    assert(JSON::parse("{'a':true}").bytesOf("a").unwrap_unchecked().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_false()
{
    let value = "false";
    assert(JSON::parse("{'a':false}").bytesOf("a").unwrap_unchecked().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_escaped()
{
    assert(JSON::parse("{'a':fals\\e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_incomplete()
{
    assert(JSON::parse("{'a':fals}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn incproperty_literal_incomplete2()
{
    assert(JSON::parse("{'a':t}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn incproperty_literal_incomplete3()
{
    assert(JSON::parse("{'a':nul}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong()
{
    assert(JSON::parse("{'a':falst}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong2()
{
    assert(JSON::parse("{'a':nult}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong3()
{
    assert(JSON::parse("{'a':truf}").bytesOf("a").is_none() == true);
}
