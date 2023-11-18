use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_string_empty()
{
    let json = "''";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_one_quote()
{
    let json = "'";
    assert(JSON::parse(json).is_none() == true);
}

#[test]
unconstrained
fn value_string_one_quote_and_characters()
{
    let json = "'ab";
    assert(JSON::parse(json).is_none() == true);
}

#[test]
unconstrained
fn value_string_number_zero()
{
    let json = "'0'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_number_multiple_zero()
{
    let json = "'000'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_minus_and_plus_number_multiple_zero()
{
    let json = "'-+000'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_number_multiple_digits()
{
    let json = "'12345'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string()
{
    let json = "'abc'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_space_string()
{
    let json = "'abc' 'abc'";
    assert(JSON::parse(json).is_none() == true);
}

#[test]
unconstrained
fn value_string_comma_string()
{
    let json = "'abc','abc'";
    assert(JSON::parse(json).is_none() == true);
}

#[test]
unconstrained
fn value_string_null()
{
    let json = "'null'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_true()
{
    let json = "'true'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_false()
{
    let json = "'false'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_value_right_brace()
{
    let json = "'5}'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_value_left_brace()
{
    let json = "'5{'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_value_right_bracket()
{
    let json = "'5]'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_value_left_bracket()
{
    let json = "'5['";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}
