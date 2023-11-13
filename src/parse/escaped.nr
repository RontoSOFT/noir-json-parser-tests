use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_string_with_escaped_quotation_mark_left()
{
    let json = "'\\'string'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_with_escaped_quotation_mark_right()
{
    let json = "'string\\''";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_with_escaped_quotation_mark_middle()
{
    let json = "'str\\'ing'";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_string_with_escaped_quotation_mark_both()
{
    let json = "'\\'string\\''";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_left()
{
    let value = "''";
    assert(JSON::parse("{'\\'a':''}").get("\\'a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_right()
{
    let value = "''";
    assert(JSON::parse("{'a\\'':''}").get("a\\'").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_middle()
{
    let value = "''";
    assert(JSON::parse("{'a\\'b':''}").get("a\\'b").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_key_with_escaped_quotation_mark_both()
{
    let value = "''";
    assert(JSON::parse("{'\\'a\\'':''}").get("\\'a\\'").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quotation_mark_left()
{
    let value = "'\\'string'";
    assert(JSON::parse("{'a':'\\'string'}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quotation_mark_right()
{
    let value = "'string\\''";
    assert(JSON::parse("{'a':'string\\''}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quotation_mark_middle()
{
    let value = "'str\\'ing'";
    assert(JSON::parse("{'a':'str\\'ing'}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quotation_mark_both()
{
    let value = "'\\'string\\''";
    assert(JSON::parse("{'a':'\\'string\\''}").get("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn empty_object_with_trailing_null_with_space()
{
    assert(JSON::parse("{} \0").is_empty() == true);
}

#[test]
unconstrained
fn empty_object_with_trailing_null_with_spaces()
{
    assert(JSON::parse("{}   \0").is_empty() == true);
}

#[test]
unconstrained
fn empty_object_with_trailing_nulls()
{
    assert(JSON::parse("{}\0\0").is_none() == true);
}

#[test]
unconstrained
fn empty_object_with_leading_null()
{
    assert(JSON::parse("\0{}").is_none() == true);
}

#[test]
unconstrained
fn empty_object_with_leading_null_and_space()
{
    assert(JSON::parse(" \0{}").is_none() == true);
}

#[test]
unconstrained
fn empty_object_with_leading_null_and_spaces()
{
    assert(JSON::parse("   \0{}").is_none() == true);
}

#[test]
unconstrained
fn empty_object_with_null_misplaced()
{
    assert(JSON::parse("{\0}").is_none() == true);
}
