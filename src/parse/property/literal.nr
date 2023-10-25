use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_literal_null()
{
    let value = "null";
    assert(JSON::parse("{'a':null}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_true()
{
    let value = "true";
    assert(JSON::parse("{'a':true}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_false()
{
    let value = "false";
    assert(JSON::parse("{'a':false}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_escaped()
{
    assert(JSON::parse("{'a':fals\\e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_fals()
{
    assert(JSON::parse("{'a':fals}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_t()
{
    assert(JSON::parse("{'a':t}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_nul()
{
    assert(JSON::parse("{'a':nul}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_falst()
{
    assert(JSON::parse("{'a':falst}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_nult()
{
    assert(JSON::parse("{'a':nult}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_truf()
{
    assert(JSON::parse("{'a':truf}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_plus_true()
{
    assert(JSON::parse("{'a':+true}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_true_plus()
{
    assert(JSON::parse("{'a':true+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_minus_false()
{
    assert(JSON::parse("{'a':-false}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_false_minus()
{
    assert(JSON::parse("{'a':false-}").bytesOf("a").is_none() == true);
}
