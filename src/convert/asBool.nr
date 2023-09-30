use dep::rontosoft::JSON;
use dep::rontosoft::convert_::asBool;

#[test]
unconstrained
fn property_literal_true_as_bool()
{
    let result = JSON::parse("{'a':true}").getBool("a");

    assert(result.is_some());
    assert(result.unwrap_unchecked() == true);
}

#[test]
unconstrained
fn property_literal_null_as_bool()
{
    let result = JSON::parse("{'a':null}").getBool("a");

    assert(result.is_some());
    assert(result.unwrap_unchecked() == false);
}

#[test]
unconstrained
fn property_literal_false_as_bool()
{
    let result = JSON::parse("{'a':false}").getBool("a");

    assert(result.is_some());
    assert(result.unwrap_unchecked() == false);
}

#[test]
unconstrained
fn property_string_true_as_bool()
{
    assert(JSON::parse("{'a':'true'}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_one_as_bool()
{
    assert(JSON::parse("{'a':1}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_one_as_bool()
{
    assert(JSON::parse("{'a':'1'}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_false_as_bool()
{
    assert(JSON::parse("{'a':'false'}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_as_bool()
{
    assert(JSON::parse("{'a':0}").getBool("a").is_none() == true);
}

unconstrained
fn property_string_quote_zero_quote_as_bool()
{
    assert(JSON::parse("{'a':'0'}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_null_as_bool()
{
    assert(JSON::parse("{'a':'null'}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong_letter_as_bool_true()
{
    assert(JSON::parse("{'a':trye}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong_letter_as_bool_false()
{
    assert(JSON::parse("{'a':falle}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong_letter_as_bool_null()
{
    assert(JSON::parse("{'a':nulm}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_one_as_bool()
{
    assert(JSON::parse("{'a':01}").getBool("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_zero_as_bool()
{
    assert(JSON::parse("{'a':000}").getBool("a").is_none() == true);
}
