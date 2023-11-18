use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_string_empty()
{
    let value = "''";
    assert(JSON::parse("{'a':''}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_one_quote()
{
    let value = "'";
    assert(JSON::parse("{'a':'}").is_none() == true);
}

#[test]
unconstrained
fn property_string_one_quote_and_characters()
{
    let value = "'ab";
    assert(JSON::parse("{'a':'ab}").is_none() == true);
}

#[test]
unconstrained
fn property_string_number_zero()
{
    let value = "'0'";
    assert(JSON::parse("{'a':'0'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_zero()
{
    let value = "'000'";
    assert(JSON::parse("{'a':'000'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_minus_and_plus_number_multiple_zero()
{
    let value = "'-+000'";
    assert(JSON::parse("{'a':'-+000'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_digits()
{
    let value = "'12345'";
    assert(JSON::parse("{'a':'12345'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string()
{
    let value = "'abc'";
    assert(JSON::parse("{'a':'abc'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_space_string()
{
    let value = "'abc' 'abc'";
    assert(JSON::parse("{'a':'abc' 'abc'}").is_none() == true);
}

#[test]
unconstrained
fn property_string_comma_string()
{
    let value = "'abc','abc'";
    assert(JSON::parse("{'a':'abc','abc'}").is_none() == true);
}

#[test]
unconstrained
fn property_string_null()
{
    let value = "'null'";
    assert(JSON::parse("{'a':'null'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_true()
{
    let value = "'true'";
    assert(JSON::parse("{'a':'true'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_false()
{
    let value = "'false'";
    assert(JSON::parse("{'a':'false'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_value_right_brace()
{
    let value = "'5}'";
    assert(JSON::parse("{'a':'5}'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_value_left_brace()
{
    let value = "'5{'";
    assert(JSON::parse("{'a':'5{'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_value_right_bracket()
{
    let value = "'5]'";
    assert(JSON::parse("{'a':'5]'}").get("a").eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_value_left_bracket()
{
    let value = "'5['";
    assert(JSON::parse("{'a':'5['}").get("a").eq_string(value) == true);
}
