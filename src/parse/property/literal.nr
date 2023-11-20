use crate::utils::can_parse_as_property;

#[test]
fn property_literal_null()
{
    assert(can_parse_as_property("null") == true);
}

#[test]
fn property_literal_true()
{
    assert(can_parse_as_property("true") == true);
}

#[test]
fn property_literal_false()
{
    assert(can_parse_as_property("false") == true);
}

#[test]
fn property_literal_fals()
{
    assert(can_parse_as_property("fals") == false);
}

#[test]
fn property_literal_t()
{
    assert(can_parse_as_property("t}") == false);
}

#[test]
fn property_literal_nul()
{
    assert(can_parse_as_property("nul}") == false);
}

#[test]
fn property_literal_falst()
{
    assert(can_parse_as_property("falst}") == false);
}

#[test]
fn property_literal_random()
{
    assert(can_parse_as_property("lfseu}") == false);
}

#[test]
fn property_literal_plus_true()
{
    assert(can_parse_as_property("+true}") == false);
}

#[test]
fn property_literal_true_plus()
{
    assert(can_parse_as_property("true+}") == false);
}

#[test]
fn property_literal_minus_false()
{
    assert(can_parse_as_property("-false}") == false);
}

#[test]
fn property_literal_false_minus()
{
    assert(can_parse_as_property("false-}") == false);
}

#[test]
fn property_literal_tru_dot_e()
{
    assert(can_parse_as_property("tru.e}") == false);
}

#[test]
fn property_literal_tru_space_e()
{
    assert(can_parse_as_property("tru e}") == false);
}

#[test]
fn property_literal_false_space_false()
{
    assert(can_parse_as_property("false false}") == false);
}

#[test]
fn property_literal_false_comma_false()
{
    assert(can_parse_as_property("false,false}") == false);
}
