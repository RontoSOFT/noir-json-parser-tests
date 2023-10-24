use dep::rontosoft::JSON;

#[test]
unconstrained
fn value_array_empty()
{
    let json = "[]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_empty_values()
{
    assert(JSON::parse("[,]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_faulty_colon()
{
    assert(JSON::parse("[:]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_left_brace_outer()
{
    assert(JSON::parse("{[]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_right_brace_outer()
{
    assert(JSON::parse("[]}").doc.len() == 0);
}
#[test]
unconstrained
fn value_array_left_brace_inner()
{
    assert(JSON::parse("[{]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_right_brace_inner()
{
    assert(JSON::parse("[}]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_duplicate_left_bracket()
{
    assert(JSON::parse("[[]").doc.len() == 0);
}
#[test]
unconstrained
fn value_array_duplicate_right_bracket()
{
    assert(JSON::parse("[]]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_empty_nested_values()
{
    assert(JSON::parse("[[,]]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_empty_nested_missing_missing_value_before()
{
    assert(JSON::parse("[,[]]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_empty_nested_missing_missing_value_after()
{
    assert(JSON::parse("[[],]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_empty_nested()
{
    let json = "[[]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_empty_nested()
{
    let json = "[[],[],[]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_empty_object()
{
    let json = "[{}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_empty_multiple_object()
{
    let json = "[{},{},{}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_single_number()
{
    let json = "[1]";
    assert(JSON::parse("[1]").doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_single_number_missing_value()
{
    assert(JSON::parse("[1,]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_multiple_numbers()
{
    let json = "[1,2,3]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_numbers_missing_value()
{
    assert(JSON::parse("[1,2,3,]").doc.len() == 0);
}

#[test]
unconstrained
fn value_array_single_number_nested()
{
    let json = "[[1]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_numbers_nested()
{
    let json = "[[1],[2],[3]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_array_numbers_nested()
{
    let json = "[[1,1],[2,2],[3,3]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_empty_string()
{
    let json = "['']";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_strings()
{
    let json = "['1','2','3']";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_mixed_types()
{
    let json = "[1,'2',true]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_null()
{
    let json = "[null,null]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_mixed_types_null_object_array()
{
    let json = "[1,null,'2',true,{},[]]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_mixed_types_missing_value()
{
    assert(JSON::parse("[1,,'2',true,{},[]]").doc.len() == 0);
}
