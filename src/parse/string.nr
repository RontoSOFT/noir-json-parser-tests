use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn property_string_number_zero()
{
    let (key, value) = ("a", "'0'");
    let bytes = JSON::parse("{'a':'0'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_zero()
{
    let (key, value) = ("a", "'000'");
    let bytes = JSON::parse("{'a':'000'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_number_multiple_digits()
{
    let (key, value) = ("a", "'12345'");
    let bytes = JSON::parse("{'a':'12345'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string()
{
    let (key, value) = ("a", "'abc'");
    let bytes = JSON::parse("{'a':'abc'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_quote()
{
    let (key, value) = ("a", "'a\\'bc'");
    let bytes = JSON::parse("{'a':'a\\'bc'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_with_double_escape()
{
    let (key, value) = ("a", "'a\\bc'");
    let bytes = JSON::parse("{'a':'a\\bc'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_with_escaped_double_quote()
{
    let (key, value) = ("a", "'a\"bc'");
    let bytes = JSON::parse("{'a':'a\"bc'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_null()
{
    let (key, value) = ("a", "'null'");
    let bytes = JSON::parse("{'a':'null'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_true()
{
    let (key, value) = ("a", "'true'");
    let bytes = JSON::parse("{'a':'true'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_string_false()
{
    let (key, value) = ("a", "'false'");
    let bytes = JSON::parse("{'a':'false'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_string_value_right_brace()
{
    let (key, value) = ("a", "'5}'");
    let bytes = JSON::parse("{'a':'5}'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_name_string_value_left_brace()
{
    let (key, value) = ("a", "'5{'");
    let bytes = JSON::parse("{'a':'5{'}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}
