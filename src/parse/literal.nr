use dep::rontosoft::JSON;
use dep::rontosoft::utils::slice_eq_array;

#[test]
unconstrained
fn property_literal_null()
{
    let (key, value) = ("a", "null");
    let bytes = JSON::parse("{'a':null}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_literal_true()
{
    let (key, value) = ("a", "true");
    let bytes = JSON::parse("{'a':true}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_literal_false()
{
    let (key, value) = ("a", "false");
    let bytes = JSON::parse("{'a':false}").bytesOf(key).unwrap_unchecked();

    assert(slice_eq_array(bytes, value.as_bytes()) == true);
}

#[test]
unconstrained
fn property_literal_escaped()
{
    assert(JSON::parse("{'a':fals\\e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_incomplete()
{
    assert(JSON::parse("{'a':fals}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn incproperty_literal_incomplete2()
{
    assert(JSON::parse("{'a':t}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn incproperty_literal_incomplete3()
{
    assert(JSON::parse("{'a':nul}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong()
{
    assert(JSON::parse("{'a':falst}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong2()
{
    assert(JSON::parse("{'a':nult}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_literal_wrong3()
{
    assert(JSON::parse("{'a':truf}").bytesOf("a").is_none() == true);
}
