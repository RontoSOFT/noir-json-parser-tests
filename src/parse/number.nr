use dep::rontosoft::parse::JSON;

#[test]
fn property_number_zero()
{
    let (key, value) = ("a", "0");

    let kvp = JSON::new("{'a':0}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_one()
{
    let (key, value) = ("a", "1");

    let kvp = JSON::new("{'a':1}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_one_zero_zero()
{
    let (key, value) = ("a", "100");

    let kvp = JSON::new("{'a':100}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_one_zero_zero_one()
{
    let (key, value) = ("a", "1001");

    let kvp = JSON::new("{'a':1001}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_multiple_one_two_three_four_five()
{
    let (key, value) = ("a", "12345");

    let kvp = JSON::new("{'a':12345}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_minus()
{
    let kvp = JSON::new("{'a':-}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_minus_zero()
{
    let (key, value) = ("a", "-0");

    let kvp = JSON::new("{'a':-0}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_minus_one()
{
    let (key, value) = ("a", "-1");

    let kvp = JSON::new("{'a':-1}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_minus_one_zero_zero()
{
    let (key, value) = ("a", "-100");

    let kvp = JSON::new("{'a':-100}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_minux_one_zero_zero_one()
{
    let (key, value) = ("a", "-1001");

    let kvp = JSON::new("{'a':-1001}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_minus_one_two_three_four_five()
{
    let (key, value) = ("a", "-12345");

    let kvp = JSON::new("{'a':-12345}").get(key);

    assert(kvp.key == key.as_bytes());
    assert(kvp.value == value.as_bytes());
}

#[test]
fn property_number_plus()
{
    let kvp = JSON::new("{'a':+}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_plus_zero()
{
    let kvp = JSON::new("{'a':+0}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_plus_one()
{
    let kvp = JSON::new("{'a':+1}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_plus_one_two_three_four_five()
{
    let kvp = JSON::new("{'a':+12345}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_double_zero()
{
    let kvp = JSON::new("{'a':00}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_leading_zero_one()
{
    let kvp = JSON::new("{'a':01}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_zero_zero_one()
{
    let kvp = JSON::new("{'a':001}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_zero_one_two_three_four_five()
{
    let kvp = JSON::new("{'a':012345}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_double_minus_zero()
{
    let kvp = JSON::new("{'a':--0}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_double_minus_one()
{
    let kvp = JSON::new("{'a':--1}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_zero_minus()
{
    let kvp = JSON::new("{'a':0-}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_minus()
{
    let kvp = JSON::new("{'a':1-}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_minus_zero_minus()
{
    let kvp = JSON::new("{'a':-0-}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_minus_one_minus()
{
    let kvp = JSON::new("{'a':-1-}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_zero_minus_zero()
{
    let kvp = JSON::new("{'a':0-0}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_minus_one()
{
    let kvp = JSON::new("{'a':1-1}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_minus_zero_minus_zero()
{
    let kvp = JSON::new("{'a':-0-0}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_minus_one_minus_one()
{
    let kvp = JSON::new("{'a':-1-1}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_comma()
{
    let kvp = JSON::new("{'a':1,}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_colon()
{
    let kvp = JSON::new("{'a':1:}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_quote()
{
    let kvp = JSON::new("{'a':1'}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_left_brace()
{
    let kvp = JSON::new("{'a':1{}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_right_brace()
{
    let kvp = JSON::new("{'a':1}}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_left_bracket()
{
    let kvp = JSON::new("{'a':1[}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}

#[test]
fn property_number_one_right_bracket()
{
    let kvp = JSON::new("{'a':1]}").get("a");

    assert(kvp.key == [0; 1]);
    assert(kvp.value == [0; 1]);
}
