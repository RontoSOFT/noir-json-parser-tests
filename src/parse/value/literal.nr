use crate::utils::can_parse_as_value;

#[test]
fn value_literal_null()
{
    assert(can_parse_as_value("null") == true);
}

#[test]
fn value_literal_true()
{
    assert(can_parse_as_value("true") == true);
}

#[test]
fn value_literal_false()
{
    assert(can_parse_as_value("false") == true);
}

#[test]
fn value_literal_fals()
{
    assert(can_parse_as_value("fals") == false);
}

#[test]
fn value_literal_t()
{
    assert(can_parse_as_value("t") == false);
}

#[test]
fn value_literal_nul()
{
    assert(can_parse_as_value("nul") == false);
}

#[test]
fn value_literal_falst()
{
    assert(can_parse_as_value("falst") == false);
}

#[test]
fn value_literal_random()
{
    assert(can_parse_as_value("lfseu") == false);
}

#[test]
fn value_literal_plus_true()
{
    assert(can_parse_as_value("+true") == false);
}

#[test]
fn value_literal_true_plus()
{
    assert(can_parse_as_value("true+") == false);
}

#[test]
fn value_literal_minus_false()
{
    assert(can_parse_as_value("-false") == false);
}

#[test]
fn value_literal_false_minus()
{
    assert(can_parse_as_value("false-") == false);
}

#[test]
fn value_literal_tru_dot_e()
{
    assert(can_parse_as_value("tru.e") == false);
}

#[test]
fn value_literal_tru_space_e()
{
    assert(can_parse_as_value("tru e") == false);
}

#[test]
fn value_literal_tru_one()
{
    assert(can_parse_as_value("tru1") == false);
}

#[test]
fn value_literal_tru_minus()
{
    assert(can_parse_as_value("tru-") == false);
}

#[test]
fn value_literal_false_space_false()
{
    assert(can_parse_as_value("false false") == false);
}

#[test]
fn value_literal_false_comma_false()
{
    assert(can_parse_as_value("false,false") == false);
}
