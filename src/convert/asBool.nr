use dep::rontosoft::convert::BytesBool;
use dep::rontosoft::parse::JSON;

#[test]
fn property_literal_true_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':true}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == true);
}

#[test]
fn property_string_true_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':'true'}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_one_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':1}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_string_one_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':'1'}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_false_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':false}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_string_false_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':'false'}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_number_zero_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':0}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

fn property_string_quote_zero_quote_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':'0'}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_null_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':null}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_some());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_string_null_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':'null'}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_wrong_letter_as_bool_true()
{
    let bytes : BytesBool = JSON::new("{'a':trye}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_wrong_letter_as_bool_false()
{
    let bytes : BytesBool = JSON::new("{'a':falle}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_literal_wrong_letter_as_bool_null()
{
    let bytes : BytesBool = JSON::new("{'a':nulm}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_number_zero_one_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':01}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}

#[test]
fn property_number_three_zero_as_bool()
{
    let bytes : BytesBool = JSON::new("{'a':000}").get("a").value;
    let result = bytes.asBool();

    assert(result.is_none());
    assert(result.unwrap_unchecked() == false);
}
