use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_number_three_zero_as_integer()
{
    assert(JSON::parse("{'a':30}").getInteger("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_as_integer()
{
    assert(JSON::parse("{'a':-30}").getInteger("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_number_three_zero_e_zero_as_integer()
{
    assert(JSON::parse("{'a':30e0}").getInteger("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_zero_as_integer()
{
    assert(JSON::parse("{'a':-30e0}").getInteger("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_number_three_zero_e_plus_zero_as_integer()
{
    assert(JSON::parse("{'a':30e+0}").getInteger("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_plus_zero_as_integer()
{
    assert(JSON::parse("{'a':-30e+0}").getInteger("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_number_three_zero_e_minus_zero_as_integer()
{
    assert(JSON::parse("{'a':30e-0}").getInteger("a").unwrap() == 30);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_minus_zero_as_integer()
{
    assert(JSON::parse("{'a':-30e-0}").getInteger("a").unwrap() == -30);
}

#[test]
unconstrained
fn property_number_three_zero_e_one_as_integer()
{
    assert(JSON::parse("{'a':30e1}").getInteger("a").unwrap() == 300);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_one_as_integer()
{
    assert(JSON::parse("{'a':-30e1}").getInteger("a").unwrap() == -300);
}

#[test]
unconstrained
fn property_number_three_zero_e_plus_one_as_integer()
{
    assert(JSON::parse("{'a':30e+1}").getInteger("a").unwrap() == 300);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_plus_one_as_integer()
{
    assert(JSON::parse("{'a':-30e+1}").getInteger("a").unwrap() == -300);
}

#[test]
unconstrained
fn property_number_three_zero_e_minus_one_as_integer()
{
    assert(JSON::parse("{'a':30e-1}").getInteger("a").unwrap() == 3);
}

#[test]
unconstrained
fn property_number_minus_three_zero_e_minus_one_as_integer()
{
    assert(JSON::parse("{'a':-30e-1}").getInteger("a").unwrap() == -3);
}

#[test]
unconstrained
fn property_number_plus_three_zero_as_integer()
{
    assert(JSON::parse("{'a':+30}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_three_zero_as_integer()
{
    assert(JSON::parse("{'a':'30'}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_minus_three_zero_as_integer()
{
    assert(JSON::parse("{'a':'-30'}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_escaped_three_zero_as_integer()
{
    assert(JSON::parse("{'a':\"30\"}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_escaped_minus_three_zero_as_integer()
{
    assert(JSON::parse("{'a':\"-30\"}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_string_thirty_as_integer()
{
    assert(JSON::parse("{'a':'thirty'}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_zero_point_zero_as_integer()
{
    assert(JSON::parse("{'a':30.0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_minus_three_zero_point_zero_as_integer()
{
    assert(JSON::parse("{'a':-30.0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_colon_zero_as_integer()
{
    assert(JSON::parse("{'a':3:0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_space_zero_as_integer()
{
    assert(JSON::parse("{'a':3 0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_left_brace_zero_as_integer()
{
    assert(JSON::parse("{'a':3{0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_right_brace_zero_as_integer()
{
    assert(JSON::parse("{'a':3}0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_quote_zero_as_integer()
{
    assert(JSON::parse("{'a':3'0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_escaped_quote_zero_as_integer()
{
    assert(JSON::parse("{'a':3\"0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_comma_zero_as_integer()
{
    assert(JSON::parse("{'a':3,0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_comma_space_zero_as_integer()
{
    assert(JSON::parse("{'a':3, 0}").getInteger("a").is_none() == true);
}

#[test]
unconstrained
fn property_number_three_space_comma_zero_as_integer()
{
    assert(JSON::parse("{'a':3 ,0}").getInteger("a").is_none() == true);
}
