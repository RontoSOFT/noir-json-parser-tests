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
fn value_literal_incomplete()
{
    assert(JSON::parse("fals").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_incomplete2()
{
    assert(JSON::parse("t").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_incomplete3()
{
    assert(JSON::parse("nul").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_wrong()
{
    assert(JSON::parse("falst").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_wrong2()
{
    assert(JSON::parse("nult").doc.len() == 0);
}

#[test]
unconstrained
fn value_literal_wrong3()
{
    assert(JSON::parse("truf").doc.len() == 0);
}
