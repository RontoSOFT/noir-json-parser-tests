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
    assert(JSON::parse("{'a':fals\\e}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_fals()
{
    assert(JSON::parse("{'a':fals}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_t()
{
    assert(JSON::parse("{'a':t}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_nul()
{
    assert(JSON::parse("{'a':nul}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_falst()
{
    assert(JSON::parse("{'a':falst}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_random()
{
    assert(JSON::parse("{'a':lfseu}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_plus_true()
{
    assert(JSON::parse("{'a':+true}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_true_plus()
{
    assert(JSON::parse("{'a':true+}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_minus_false()
{
    assert(JSON::parse("{'a':-false}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_false_minus()
{
    assert(JSON::parse("{'a':false-}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_tru_dot_e()
{
    assert(JSON::parse("{'a':tru.e}").doc.len() == 0);
}

#[test]
unconstrained
fn property_literal_tru_space_e()
{
    assert(JSON::parse("{'a':tru e}").doc.len() == 0);
}
