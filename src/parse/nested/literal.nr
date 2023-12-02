use crate::utils::can_parse_as_nested;

#[test]
fn literal_null()
{
    assert(can_parse_as_nested("null") == true);
}

#[test]
fn literal_true()
{
    assert(can_parse_as_nested("true") == true);
}

#[test]
fn literal_false()
{
    assert(can_parse_as_nested("false") == true);
}

#[test]
fn fals()
{
    assert(can_parse_as_nested("fals") == false);
}

#[test]
fn t()
{
    assert(can_parse_as_nested("t}") == false);
}

#[test]
fn nul()
{
    assert(can_parse_as_nested("nul}") == false);
}

#[test]
fn falst()
{
    assert(can_parse_as_nested("falst}") == false);
}

#[test]
fn random()
{
    assert(can_parse_as_nested("lfseu}") == false);
}

#[test]
fn plus_true()
{
    assert(can_parse_as_nested("+true}") == false);
}

#[test]
fn true_plus()
{
    assert(can_parse_as_nested("true+}") == false);
}

#[test]
fn minus_false()
{
    assert(can_parse_as_nested("-false}") == false);
}

#[test]
fn false_minus()
{
    assert(can_parse_as_nested("false-}") == false);
}

#[test]
fn tru_dot_e()
{
    assert(can_parse_as_nested("tru.e}") == false);
}

#[test]
fn tru_space_e()
{
    assert(can_parse_as_nested("tru e}") == false);
}

#[test]
fn false_space_false()
{
    assert(can_parse_as_nested("false false}") == false);
}

#[test]
fn false_comma_false()
{
    assert(can_parse_as_nested("false,false}") == false);
}
