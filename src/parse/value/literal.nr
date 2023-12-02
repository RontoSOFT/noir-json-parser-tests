use crate::utils::can_parse_as_value;

#[test]
fn literal_null()
{
    assert(can_parse_as_value("null") == true);
}

#[test]
fn literal_true()
{
    assert(can_parse_as_value("true") == true);
}

#[test]
fn literal_false()
{
    assert(can_parse_as_value("false") == true);
}

#[test]
fn fals()
{
    assert(can_parse_as_value("fals") == false);
}

#[test]
fn t()
{
    assert(can_parse_as_value("t") == false);
}

#[test]
fn nul()
{
    assert(can_parse_as_value("nul") == false);
}

#[test]
fn falst()
{
    assert(can_parse_as_value("falst") == false);
}

#[test]
fn random()
{
    assert(can_parse_as_value("lfseu") == false);
}

#[test]
fn plus_true()
{
    assert(can_parse_as_value("+true") == false);
}

#[test]
fn true_plus()
{
    assert(can_parse_as_value("true+") == false);
}

#[test]
fn minus_false()
{
    assert(can_parse_as_value("-false") == false);
}

#[test]
fn false_minus()
{
    assert(can_parse_as_value("false-") == false);
}

#[test]
fn tru_dot_e()
{
    assert(can_parse_as_value("tru.e") == false);
}

#[test]
fn tru_space_e()
{
    assert(can_parse_as_value("tru e") == false);
}

#[test]
fn tru_one()
{
    assert(can_parse_as_value("tru1") == false);
}

#[test]
fn tru_minus()
{
    assert(can_parse_as_value("tru-") == false);
}

#[test]
fn false_space_false()
{
    assert(can_parse_as_value("false false") == false);
}

#[test]
fn false_comma_false()
{
    assert(can_parse_as_value("false,false") == false);
}
