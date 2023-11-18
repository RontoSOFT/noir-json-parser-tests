#[test]
unconstrained
fn convert_value_string_empty_object()
{
    assert("''".as_json().is_none() == true);
}

#[test]
unconstrained
fn convert_value_string_object_empty()
{
    assert("'{}'".as_json().is_empty() == true);
}

#[test]
unconstrained
fn convert_value_string_object_empty_with_space()
{
    assert("'{ }'".as_json().is_empty() == true);
}

#[test]
unconstrained
fn convert_value_string_object()
{
    assert("'{\\'a\\':1}'".as_json().get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn convert_value_string_nested_object()
{
    assert("'{\\'a\\':{\\'b\\':1}}'".as_json().get_object("a").get("b").eq_string("1") == true);
}
