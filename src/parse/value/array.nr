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
fn value_array_one_empty_string()
{
    let json = "['']";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_empty_strings()
{
    let json = "['','','']";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_empty_object()
{
    let json = "[{}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_empty_objects()
{
    let json = "[{},{},{}]";
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

#[test]
unconstrained
fn value_array_one_object_one_property()
{
    let json = "[{'a':1}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_object_one_property_whitespaces()
{
    let json = "[ { 'a' : 1 } ]";
    assert(JSON::parse(json).doc[0].value.eq_string("[{'a':1}]") == true);

    let json = "[    {  'a' : 1   }     ]";
    assert(JSON::parse(json).doc[0].value.eq_string("[{'a':1}]") == true);
}

#[test]
unconstrained
fn value_array_one_object_multiple_properties()
{
    let json = "[{'a':1,'b':true,'c':'123'}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_multiple_properties()
{
    let json = "[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_object_one_property_array_one_value()
{
    let json = "[{'a':[1]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_array_one_value()
{
    let json = "[{'a':[1]},{'a':[2]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_object_one_property_array_multiple_values()
{
    let json = "[{'abc':[1,2,3]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_array_multiple_values()
{
    let json = "[{'abc':[1,2,3]},{'abc':[4,5,6]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_object_one_property_with_array_single_value()
{
    let json = "[{'a':1,'b':true,'a':[1]}]";
    assert(JSON::parse(json).doc[0].value.eq_string("[{'a':1,'b':true,'a':[1]}]") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_with_array_single_value()
{
    let json = "[{'a':1,'b':true,'a':[1]},{'a':2,'b':false,'a':[2]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_one_object_one_property_with_array_multiple_values()
{
    let json = "[{'a':1,'b':true,'abc':[1,2,3]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_with_array_multiple_values()
{
    let json = "[{'a':1,'b':true,'a':[1,2,3]},{'a':2,'b':false,'a':[4,5,6]}]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}
