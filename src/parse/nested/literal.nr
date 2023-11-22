use crate::utils::can_parse_as_nested;

#[test]
fn nested_literal_null()
{
    assert(can_parse_as_nested("null") == true);
}

#[test]
fn nested_literal_true()
{
    assert(can_parse_as_nested("true") == true);
}

#[test]
fn nested_literal_false()
{
    assert(can_parse_as_nested("false") == true);
}

#[test]
fn nested_literal_fals()
{
    assert(can_parse_as_nested("fals") == false);
}

#[test]
fn nested_literal_t()
{
    assert(can_parse_as_nested("t}") == false);
}

#[test]
fn nested_literal_nul()
{
    assert(can_parse_as_nested("nul}") == false);
}

#[test]
fn nested_literal_falst()
{
    assert(can_parse_as_nested("falst}") == false);
}

#[test]
fn nested_literal_random()
{
    assert(can_parse_as_nested("lfseu}") == false);
}

#[test]
fn nested_literal_plus_true()
{
    assert(can_parse_as_nested("+true}") == false);
}

#[test]
fn nested_literal_true_plus()
{
    assert(can_parse_as_nested("true+}") == false);
}

#[test]
fn nested_literal_minus_false()
{
    assert(can_parse_as_nested("-false}") == false);
}

#[test]
fn nested_literal_false_minus()
{
    assert(can_parse_as_nested("false-}") == false);
}

#[test]
fn nested_literal_tru_dot_e()
{
    assert(can_parse_as_nested("tru.e}") == false);
}

#[test]
fn nested_literal_tru_space_e()
{
    assert(can_parse_as_nested("tru e}") == false);
}

#[test]
fn nested_literal_false_space_false()
{
    assert(can_parse_as_nested("false false}") == false);
}

#[test]
fn nested_literal_false_comma_false()
{
    assert(can_parse_as_nested("false,false}") == false);
}
