#[test]
unconstrained
fn convert_value_literal_string()
{
    assert("'false'".as_string().eq_string("false") == true);
}

#[test]
unconstrained
fn convert_value_number_string()
{
    assert("'123'".as_string().eq_string("123") == true);
}

#[test]
unconstrained
fn convert_value_number_begin_single_quote_string()
{
    assert("'123".as_string().len() == 0);
}

#[test]
unconstrained
fn convert_value_number_end_single_quote_string()
{
    assert("123'".as_string().len() == 0);
}
