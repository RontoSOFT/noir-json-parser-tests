use crate::utils::can_parse_as_property;

#[test]
fn literal_null()
{
    assert(can_parse_as_property("null") == true);
}

#[test]
fn literal_true()
{
    assert(can_parse_as_property("true") == true);
}

#[test]
fn literal_false()
{
    assert(can_parse_as_property("false") == true);
}

#[test]
fn fals()
{
    assert(can_parse_as_property("fals") == false);
}

#[test]
fn t()
{
    assert(can_parse_as_property("t}") == false);
}

#[test]
fn nul()
{
    assert(can_parse_as_property("nul}") == false);
}

#[test]
fn falst()
{
    assert(can_parse_as_property("falst}") == false);
}

#[test]
fn random()
{
    assert(can_parse_as_property("lfseu}") == false);
}

#[test]
fn plus_true()
{
    assert(can_parse_as_property("+true}") == false);
}

#[test]
fn true_plus()
{
    assert(can_parse_as_property("true+}") == false);
}

#[test]
fn minus_false()
{
    assert(can_parse_as_property("-false}") == false);
}

#[test]
fn false_minus()
{
    assert(can_parse_as_property("false-}") == false);
}

#[test]
fn tru_dot_e()
{
    assert(can_parse_as_property("tru.e}") == false);
}

#[test]
fn tru_space_e()
{
    assert(can_parse_as_property("tru e}") == false);
}

#[test]
fn false_space_false()
{
    assert(can_parse_as_property("false false}") == false);
}

#[test]
fn false_comma_false()
{
    assert(can_parse_as_property("false,false}") == false);
}
