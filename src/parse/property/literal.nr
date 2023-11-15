use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_literal_null()
{
    let value = "null";
    assert(JSON::parse("{'a':null}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_true()
{
    let value = "true";
    assert(JSON::parse("{'a':true}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_false()
{
    let value = "false";
    assert(JSON::parse("{'a':false}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_literal_fals()
{
    assert(JSON::parse("{'a':fals}").is_none());
}

#[test]
unconstrained
fn property_literal_t()
{
    assert(JSON::parse("{'a':t}").is_none());
}

#[test]
unconstrained
fn property_literal_nul()
{
    assert(JSON::parse("{'a':nul}").is_none());
}

#[test]
unconstrained
fn property_literal_falst()
{
    assert(JSON::parse("{'a':falst}").is_none());
}

#[test]
unconstrained
fn property_literal_random()
{
    assert(JSON::parse("{'a':lfseu}").is_none());
}

#[test]
unconstrained
fn property_literal_plus_true()
{
    assert(JSON::parse("{'a':+true}").is_none());
}

#[test]
unconstrained
fn property_literal_true_plus()
{
    assert(JSON::parse("{'a':true+}").is_none());
}

#[test]
unconstrained
fn property_literal_minus_false()
{
    assert(JSON::parse("{'a':-false}").is_none());
}

#[test]
unconstrained
fn property_literal_false_minus()
{
    assert(JSON::parse("{'a':false-}").is_none());
}

#[test]
unconstrained
fn property_literal_tru_dot_e()
{
    assert(JSON::parse("{'a':tru.e}").is_none());
}

#[test]
unconstrained
fn property_literal_tru_space_e()
{
    assert(JSON::parse("{'a':tru e}").is_none());
}

#[test]
unconstrained
fn property_literal_false_space_false()
{
    assert(JSON::parse("{'a':false false}").is_none());
}

#[test]
unconstrained
fn property_literal_false_comma_false()
{
    assert(JSON::parse("{'a':false,false}").is_none());
}
