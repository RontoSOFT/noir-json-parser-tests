use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_name_single()
{
    assert(JSON::parse("{'a':5}").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_multi()
{
    assert(JSON::parse("{'abc':5}").bytesOf("abc").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_single_spaces()
{
    assert(JSON::parse(" { 'a' : 5 } ").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_single_repeated_spaces()
{
    assert(JSON::parse("  {  'a'  :  5  }  ").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_single_random_spaces()
{
    assert(JSON::parse("{  'a':  5} ").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_colon()
{
    assert(JSON::parse("{'a:':5}").bytesOf("a:").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_space()
{
    assert(JSON::parse("{'a ':5}").bytesOf("a ").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_right_brace()
{
    assert(JSON::parse("{'a}':5}").bytesOf("a}").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_left_brace()
{
    assert(JSON::parse("{'a{':5}").bytesOf("a{").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_right_bracket()
{
    assert(JSON::parse("{'a]':5}").bytesOf("a]").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_left_bracket()
{
    assert(JSON::parse("{'a[':5}").bytesOf("a[").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_left_and_right()
{
    assert(JSON::parse("{\\'a\\':5}").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_left()
{
    assert(JSON::parse("{\\'a':5}").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_name_escaped_right()
{
    assert(JSON::parse("{'a\\':5}").bytesOf("a").unwrap().eq_string("5") == true);
}

#[test]
unconstrained
fn property_faulty_colon()
{
    assert(JSON::parse("{:'a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_leading_comma()
{
    assert(JSON::parse("{,'a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_comma_after_key()
{
    assert(JSON::parse("{'a',:1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_comma_after_colon()
{
    assert(JSON::parse("{'a':,1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_trailing_comma()
{
    assert(JSON::parse("{'a':1,}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_one_comma_minus()
{
    assert(JSON::parse("{'a':1,-}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty_key()
{
    assert(JSON::parse("{''}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty()
{
    assert(JSON::parse("{}").doc.is_empty_object());
}

#[test]
unconstrained
fn property_name_faulty_colon()
{
    assert(JSON::parse("{:}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty_comma()
{
    assert(JSON::parse("{,}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty_key_with_colon()
{
    assert(JSON::parse("{'':}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_key_with_colon_missing_value()
{
    assert(JSON::parse("{'a':}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_missing_key_with_value()
{
    assert(JSON::parse("{:1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty_key_with_value()
{
    assert(JSON::parse("{'':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_empty_key_second_key()
{
    assert(JSON::parse("{'a':1,''}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_missing_colon_second_key()
{
    assert(JSON::parse("{'a':1,'b'}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_missing_value_second_key()
{
    assert(JSON::parse("{'a':1,'b':}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_quote_before_key()
{
    assert(JSON::parse("{''a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_quote_after_key()
{
    assert(JSON::parse("{'a'':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_left_brace_before_key()
{
    assert(JSON::parse("{{'a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_left_brace_after_key()
{
    assert(JSON::parse("{'a'{:1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_right_brace_before_key()
{
    assert(JSON::parse("{}'a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_right_brace_after_key()
{
    assert(JSON::parse("{'a'}:1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_left_bracket_before_key()
{
    assert(JSON::parse("{['a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_left_bracket_after_key()
{
    assert(JSON::parse("{'a'[:1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_right_bracket_before_key()
{
    assert(JSON::parse("{]'a':1}").doc.len() == 0);
}

#[test]
unconstrained
fn property_name_right_bracket_after_key()
{
    assert(JSON::parse("{'a']:1}").doc.len() == 0);
}
