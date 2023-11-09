use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_literal_null()
{
    let json = "null";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_literal_true()
{
    let json = "true";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_literal_false()
{
    let json = "false";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_literal_escaped()
{
    assert(JSON::parse("fals\\e").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_fals()
{
    assert(JSON::parse("fals").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_t()
{
    assert(JSON::parse("t").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_nul()
{
    assert(JSON::parse("nul").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_falst()
{
    assert(JSON::parse("falst").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_random()
{
    assert(JSON::parse("lfseu").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_plus_true()
{
    assert(JSON::parse("+true").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_true_plus()
{
    assert(JSON::parse("true+").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_minus_false()
{
    assert(JSON::parse("-false").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_false_minus()
{
    assert(JSON::parse("false-").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_tru_dot_e()
{
    assert(JSON::parse("tru.e").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_tru_space_e()
{
    assert(JSON::parse("tru e").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_tru_one()
{
    assert(JSON::parse("tru1").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_tru_minus()
{
    assert(JSON::parse("tru-").doc.len() == 0);
}
