use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_number_zero_e_zero()
{
    let (key, value) = ("a", "0e0");
    let bytes = JSON::parse("{'a':0e0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_E_zero()
{
    let (key, value) = ("a", "0E0");
    let bytes = JSON::parse("{'a':0E0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_e_plus_zero()
{
    let (key, value) = ("a", "0e+0");
    let bytes = JSON::parse("{'a':0e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_e_minus_zero()
{
    let (key, value) = ("a", "0e-0");
    let bytes = JSON::parse("{'a':0e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_zero_e_minus_zero()
{
    let (key, value) = ("a", "-0e-0");
    let bytes = JSON::parse("{'a':-0e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_zero_e_plus_zero()
{
    let (key, value) = ("a", "-0e+0");
    let bytes = JSON::parse("{'a':-0e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_plus_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':+0e+0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':+0e-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_zero_point_zero_e_plus_zero()
{
    assert(JSON::parse("{'a':+0.0e+0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_plus_zero_point_zero_e_minus_zero()
{
    assert(JSON::parse("{'a':+0.0e-0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_e_zero_plus_zero()
{
    let (key, value) = ("a", "0.0e+0");
    let bytes = JSON::parse("{'a':0.0e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_e_zero_minus_zero()
{
    let (key, value) = ("a", "0.0e-0");
    let bytes = JSON::parse("{'a':0.0e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_zero_point_zero_e_zero_minus_zero()
{
    let (key, value) = ("a", "-0.0e-0");
    let bytes = JSON::parse("{'a':-0.0e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_minus_zero_point_zero_e_zero_plus_zero()
{
    let (key, value) = ("a", "-0.0e+0");
    let bytes = JSON::parse("{'a':-0.0e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_e_letter()
{
    assert(JSON::parse("{'a':0.0ef}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_e_escaped_zero()
{
    assert(JSON::parse("{'a':0.0e\0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_escaped_zero_point_zero_e_zero()
{
    assert(JSON::parse("{'a':\0.0e0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_escaped_e_zero()
{
    assert(JSON::parse("{'a':0.0\\e0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_plus_zero_e_zero()
{
    assert(JSON::parse("{'a':0+e0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_plus_zero_E_zero()
{
    assert(JSON::parse("{'a':0+E0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_zero_e_minus_minus_zero()
{
    assert(JSON::parse("{'a':-0e--0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_point_zero_e_zero_plus_plus_zero()
{
    assert(JSON::parse("{'a':0.0e++0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_e()
{
    assert(JSON::parse("{'a':1e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_e_minus()
{
    assert(JSON::parse("{'a':1e-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_e_plus()
{
    assert(JSON::parse("{'a':1e+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_e()
{
    assert(JSON::parse("{'a':1.e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_e_minus()
{
    assert(JSON::parse("{'a':1.e-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_e_plus()
{
    assert(JSON::parse("{'a':1.e+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_zero_e()
{
    assert(JSON::parse("{'a':1.0e}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_zero_e_minus()
{
    assert(JSON::parse("{'a':1.0e-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_one_point_zero_e_plus()
{
    assert(JSON::parse("{'a':1.0e+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_one_point_zero_e_plus()
{
    assert(JSON::parse("{'a':-1.0e+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_one_point_zero_e_minus()
{
    assert(JSON::parse("{'a':-1.0e-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_e_zero_point_zero_e_zero()
{
    assert(JSON::parse("{'a':0e0.0e0}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_e_plus()
{
    assert(JSON::parse("{'a':0e+}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_e_minus()
{
    assert(JSON::parse("{'a':0e-}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_zero_e_zero_one()
{
    let (key, value) = ("a", "0e01");
    let bytes = JSON::parse("{'a':0e01}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_e_one_zero()
{
    let (key, value) = ("a", "0e10");
    let bytes = JSON::parse("{'a':0e10}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_zero_e_one_zero_one()
{
    let (key, value) = ("a", "0e101");
    let bytes = JSON::parse("{'a':0e101}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_e_plus_zero()
{
    let (key, value) = ("a", "1e+0");
    let bytes = JSON::parse("{'a':1e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_e_minus_zero()
{
    let (key, value) = ("a", "0e-0");
    let bytes = JSON::parse("{'a':0e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_e_plus_zero()
{
    let (key, value) = ("a", "10e+0");
    let bytes = JSON::parse("{'a':10e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_e_minus_zero()
{
    let (key, value) = ("a", "10e-0");
    let bytes = JSON::parse("{'a':10e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_e_plus_zero()
{
    let (key, value) = ("a", "100e+0");
    let bytes = JSON::parse("{'a':100e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_e_minus_zero()
{
    let (key, value) = ("a", "100e-0");
    let bytes = JSON::parse("{'a':100e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_one_e_plus_zero()
{
    let (key, value) = ("a", "1001e+0");
    let bytes = JSON::parse("{'a':1001e+0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}

#[test]
unconstrained
fn property_number_one_zero_zero_one_e_minus_zero()
{
    let (key, value) = ("a", "1001e-0");
    let bytes = JSON::parse("{'a':1001e-0}").bytesOf(key).unwrap_unchecked();

    assert(bytes.eq_string(value) == true);
}
