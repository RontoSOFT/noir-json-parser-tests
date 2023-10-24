use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_string_number_zero()
{
    let value = "'0'";
    assert(JSON::parse("{'a':'0'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_zero()
{
    let value = "'000'";
    assert(JSON::parse("{'a':'000'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_digits()
{
    let value = "'12345'";
    assert(JSON::parse("{'a':'12345'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string()
{
    let value = "'abc'";
    assert(JSON::parse("{'a':'abc'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quote()
{
    let value = "'a\\'bc'";
    assert(JSON::parse("{'a':'a\\'bc'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_double_escape()
{
    let value = "'a\\bc'";
    assert(JSON::parse("{'a':'a\\bc'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_double_quote()
{
    let (key, value) = ("a", "'a\"bc'");
    assert(JSON::parse("{'a':'a\"bc'}").bytesOf(key).unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_null()
{
    let value = "'null'";
    assert(JSON::parse("{'a':'null'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_true()
{
    let value = "'true'";
    assert(JSON::parse("{'a':'true'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_false()
{
    let value = "'false'";
    assert(JSON::parse("{'a':'false'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_name_string_value_right_brace()
{
    let value = "'5}'";
    assert(JSON::parse("{'a':'5}'}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_name_string_value_left_brace()
{
    let value = "'5{'";
    assert(JSON::parse("{'a':'5{'}").bytesOf("a").unwrap().eq_string(value) == true);
}
