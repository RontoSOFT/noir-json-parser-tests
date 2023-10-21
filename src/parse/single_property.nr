use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_name_single()
{
    assert(JSON::parse("{'a':5}").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_multi()
{
    assert(JSON::parse("{'abc':5}").bytesOf("abc").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_missing_value()
{
    assert(JSON::parse("{'a':}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_missing_value2()
{
    assert(JSON::parse("{'a':").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_single_spaces()
{
    assert(JSON::parse(" { 'a' : 5 } ").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_single_repeated_spaces()
{
    assert(JSON::parse("  {  'a'  :  5  }  ").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_single_random_spaces()
{
    assert(JSON::parse("{  'a':  5} ").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_colon()
{
    assert(JSON::parse("{'a:':5}").bytesOf("a:").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_space()
{
    assert(JSON::parse("{'a ':5}").bytesOf("a ").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_right_brace()
{
    assert(JSON::parse("{'a}':5}").bytesOf("a}").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_left_brace()
{
    assert(JSON::parse("{'a{':5}").bytesOf("a{").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_right_bracket()
{
    assert(JSON::parse("{'a]':5}").bytesOf("a]").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_left_bracket()
{
    assert(JSON::parse("{'a[':5}").bytesOf("a[").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_left_and_right()
{
    assert(JSON::parse("{\\'a\\':5}").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_left()
{
    assert(JSON::parse("{\\'a':5}").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_right()
{
    assert(JSON::parse("{'a\\':5}").bytesOf("a").unwrap_unchecked().eq_string("5") == true);
}

#[test]
unconstrained
fn property_faulty_colon()
{
    assert(JSON::parse("{:'a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_comma_before()
{
    assert(JSON::parse("{,'a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_comma_after()
{
    assert(JSON::parse("{'a',:1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_quote_before()
{
    assert(JSON::parse("{''a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_quote_after()
{
    assert(JSON::parse("{'a'':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_left_brace_before()
{
    assert(JSON::parse("{{'a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_left_brace_after()
{
    assert(JSON::parse("{'a'{:1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_right_brace_before()
{
    assert(JSON::parse("{}'a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_right_brace_after()
{
    assert(JSON::parse("{'a'}:1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_left_bracket_before()
{
    assert(JSON::parse("{['a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_left_bracket_after()
{
    assert(JSON::parse("{'a'[:1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_right_bracket_before()
{
    assert(JSON::parse("{]'a':1}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_name_right_bracket_after()
{
    assert(JSON::parse("{'a']:1}").bytesOf("a").is_none() == true);
}
