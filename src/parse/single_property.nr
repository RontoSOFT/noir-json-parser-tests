use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn property_name_single()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("{'a':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_multi()
{
    let (key, value) = ("abc", "5");
    let bytes = JSON::parse("{'abc':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
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
    let (key, value) = ("a", "5");
    let bytes = JSON::parse(" { 'a' : 5 } ").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_single_repeated_spaces()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("  {  'a'  :  5  }  ").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_single_random_spaces()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("{  'a':  5} ").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_colon()
{
    let (key, value) = ("a:", "5");
    let bytes = JSON::parse("{'a:':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_space()
{
    let (key, value) = ("a ", "5");
    let bytes = JSON::parse("{'a ':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_right_brace()
{
    let (key, value) = ("a}", "5");
    let bytes = JSON::parse("{'a}':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_left_brace()
{
    let (key, value) = ("a{", "5");
    let bytes = JSON::parse("{'a{':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_right_bracket()
{
    let (key, value) = ("a]", "5");
    let bytes = JSON::parse("{'a]':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_left_bracket()
{
    let (key, value) = ("a[", "5");
    let bytes = JSON::parse("{'a[':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_escaped_left_and_right()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("{\\'a\\':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_escaped_left()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("{\\'a':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_escaped_right()
{
    let (key, value) = ("a", "5");
    let bytes = JSON::parse("{'a\\':5}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
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
