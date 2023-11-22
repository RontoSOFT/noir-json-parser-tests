use dep::rontosoft::JSON;
use dep::rontosoft::Property;

use crate::utils::can_parse_as_nested;

#[test]
fn nested_array_empty()
{
    assert(can_parse_as_nested("[]") == true);
}

#[test]
fn nested_array_left_bracket()
{
    assert(can_parse_as_nested("[") == false);
}

#[test]
fn nested_array_right_bracket()
{
    assert(can_parse_as_nested("]") == false);
}

#[test]
fn nested_array_left_bracket_and_number()
{
    assert(can_parse_as_nested("[12") == false);
}

#[test]
fn nested_array_right_bracket_and_number()
{
    assert(can_parse_as_nested("12]") == false);
}

#[test]
fn nested_array_left_bracket_and_number_quote()
{
    assert(can_parse_as_nested("[12'") == false);
}

#[test]
fn nested_array_quote_right_bracket_and_number()
{
    assert(can_parse_as_nested("'12]") == false);
}

#[test]
fn nested_array_empty_values()
{
    assert(can_parse_as_nested("[,]") == false);
}

#[test]
fn nested_array_faulty_colon()
{
    assert(can_parse_as_nested("[:]") == false);
}

#[test]
fn nested_array_left_brace_outer()
{
    assert(can_parse_as_nested("{[]") == false);
}

#[test]
fn nested_array_right_brace_outer()
{
    assert(can_parse_as_nested("[]}") == false);
}

#[test]
fn nested_array_left_brace_inner()
{
    assert(can_parse_as_nested("[{]") == false);
}

#[test]
fn nested_array_right_brace_inner()
{
    assert(can_parse_as_nested("[}]") == false);
}

#[test]
fn nested_array_duplicate_left_bracket()
{
    assert(can_parse_as_nested("[[]") == false);
}

#[test]
fn nested_array_duplicate_right_bracket()
{
    assert(can_parse_as_nested("[]]") == false);
}

#[test]
fn nested_array_empty_space_empty()
{
    assert(can_parse_as_nested("[] []") == false);
}

#[test]
fn nested_array_empty_comma_empty()
{
    assert(can_parse_as_nested("[],[]") == false);
}

#[test]
fn nested_array_empty_nested_values()
{
    assert(can_parse_as_nested("[[,]]") == false);
}

#[test]
fn nested_array_empty_nested_missing_missing_value_before()
{
    assert(can_parse_as_nested("[,[]]") == false);
}

#[test]
fn nested_array_empty_nested_missing_missing_value_after()
{
    assert(can_parse_as_nested("[[],]") == false);
}

#[test]
fn nested_array_empty_nested()
{
    assert(can_parse_as_nested("[[]]") == true);
}

#[test]
fn nested_array_multiple_empty_nested()
{
    assert(can_parse_as_nested("[[],[],[]]") == true);
}

#[test]
fn nested_array_single_number()
{
    assert(can_parse_as_nested("[1]") == true);
}

#[test]
fn nested_array_single_number_missing_value()
{
    assert(can_parse_as_nested("[[1,]") == false);
}

#[test]
fn nested_array_number_faulty_colon()
{
    assert(can_parse_as_nested("[1:]") == false);
}

#[test]
fn nested_array_multiple_numbers()
{
    assert(can_parse_as_nested("[1,2,3]") == true);
}

#[test]
fn nested_array_multiple_numbers_missing_value()
{
    assert(can_parse_as_nested("[[1,2,3,]") == false);
}

#[test]
fn nested_array_multiple_numbers_missing_value_space()
{
    assert(can_parse_as_nested("[1,2,3, ]") == false);
}

#[test]
fn nested_array_single_number_nested()
{
    assert(can_parse_as_nested("[[1]]") == true);
}

#[test]
fn nested_array_numbers_multiple_nested()
{
    assert(can_parse_as_nested("[[1],[2],[3]]") == true);
}

#[test]
fn nested_array_multiple_array_numbers_nested()
{
    assert(can_parse_as_nested("[[1,1],[2,2],[3,3]]") == true);
}

#[test]
fn nested_array_one_empty_string()
{
    assert(can_parse_as_nested("['']") == true);
}

#[test]
fn nested_array_multiple_empty_strings()
{
    assert(can_parse_as_nested("['','','']") == true);
}

#[test]
fn nested_array_multiple_strings()
{
    assert(can_parse_as_nested("['1','2','3']") == true);
}

#[test]
fn nested_array_multiple_mixed_types()
{
    assert(can_parse_as_nested("[1,'2',true]") == true);
}

#[test]
fn nested_array_null_null()
{
    assert(can_parse_as_nested("[null,null]") == true);
}

#[test]
fn nested_array_single_number_letter()
{
    assert(can_parse_as_nested("[1x]") == false);
}

#[test]
fn nested_array_single_number_literal_letter()
{
    assert(can_parse_as_nested("[1f]") == false);
}

#[test]
fn nested_array_single_literal_wrong_trux()
{
    assert(can_parse_as_nested("[trux]") == false);
}

#[test]
fn nested_array_single_literal_wrong_truf()
{
    assert(can_parse_as_nested("[truf]") == false);
}

#[test]
fn nested_array_single_literal_wrong_nul()
{
    assert(can_parse_as_nested("[nul]") == false);
}

#[test]
fn nested_array_single_literal_wrong_random()
{
    assert(can_parse_as_nested("[lfseu]") == false);
}

#[test]
fn nested_array_literal_faulty_colon()
{
    assert(can_parse_as_nested("[true:]") == false);
}

#[test]
fn nested_array_literal_true_space_true()
{
    assert(can_parse_as_nested("[true true]") == false);
}

#[test]
fn nested_array_single_number_whitespace()
{
    assert(can_parse_as_nested("[1 2]") == false);
}

#[test]
fn nested_array_string_space_string()
{
    assert(can_parse_as_nested("['string' 'string']") == false);
}

#[test]
fn nested_array_array_space_array()
{
    assert(can_parse_as_nested("[[] []]") == false);
}

#[test]
fn nested_array_object_space_object()
{
    assert(can_parse_as_nested("[{} {}]") == false);
}

#[test]
fn nested_array_mixed_types_missing_value()
{
    assert(can_parse_as_nested("[1,,'2',true,[],{}]") == false);
}

#[test]
unconstrained
fn nested_array_empty_object()
{
    let json = JSON::parse("{'a':{'b':[{}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(1).is_empty() == true);
}

#[test]
unconstrained
fn nested_array_empty_multiple_objects()
{
    let json = JSON::parse("{'a':{'b':[{},{},{}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 4);

    assert(json.child(0).len() == 1);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
    assert(json.child(3).is_empty() == true);
}

#[test]
unconstrained
fn nested_array_empty_multiple_objects_nested_arrays()
{
    let json = JSON::parse("{'a':{'b':[[{}],[{}],[{}]]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 4);

    assert(json.child(0).len() == 1);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
    assert(json.child(3).is_empty() == true);
}

#[test]
unconstrained
fn nested_array_mixed_types_null_object_array()
{
    let json = JSON::parse("{'a':{'b':[1,null,'2',true,[],{}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(1).is_empty() == true);
}

#[test]
unconstrained
fn nested_array_one_object_one_property()
{
    let json = JSON::parse("{'a':{'b':[{'c':1}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("c").eq_string("1") == true);
}

#[test]
unconstrained
fn nested_array_one_object_multiple_properties()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'c':'123'}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("c").eq_string("'123'") == true);
}

#[test]
unconstrained
fn nested_array_multiple_objects_multiple_properties()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("c").eq_string("'123'") == true);

    assert(json.child(2).len() == 3);
    assert(json.child(2).get("a").eq_string("2") == true);
    assert(json.child(2).get("b").eq_string("false") == true);
    assert(json.child(2).get("c").eq_string("'456'") == true);
}

#[test]
unconstrained
fn nested_array_one_object_one_property_array_one_value()
{
    let json = JSON::parse("{'a':{'b':[{'c':[1]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(1).len() == 1);
    assert(json.child(1).get("c").eq_string("[1]") == true);
}

#[test]
unconstrained
fn nested_array_multiple_objects_one_property_array_one_value()
{
    let json = JSON::parse("{'a':{'b':[{'a':[1]},{'b':[2]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("a").eq_string("[1]") == true);

    assert(json.child(2).len() == 1);
    assert(json.child(2).get("b").eq_string("[2]") == true);
}

#[test]
unconstrained
fn nested_array_one_object_one_property_array_multiple_values()
{
    let json = JSON::parse("{'a':{'b':[{'abc':[1,2,3]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn nested_array_multiple_objects_one_property_array_multiple_values()
{
    let json = JSON::parse("{'a':{'b':[{'abc':[1,2,3]},{'def':[4,5,6]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(2).len() == 1);
    assert(json.child(2).get("def").eq_string("[4,5,6]") == true);
}

#[test]
unconstrained
fn nested_array_one_object_one_property_array_single_value()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'c':[1]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("c").eq_string("[1]") == true);
}

#[test]
unconstrained
fn nested_array_multiple_objects_one_property_array_single_value()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'c':[1]},{'a':2,'b':false,'c':[2]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("c").eq_string("[1]") == true);

    assert(json.child(2).len() == 3);
    assert(json.child(2).get("a").eq_string("2") == true);
    assert(json.child(2).get("b").eq_string("false") == true);
    assert(json.child(2).get("c").eq_string("[2]") == true);
}

#[test]
unconstrained
fn nested_array_one_object_multiple_properties_array_multiple_values()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'abc':[1,2,3]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn nested_array_multiple_objects_one_property_array_multiple_mixed_values()
{
    let json = JSON::parse("{'a':{'b':[{'a':1,'b':true,'abc':[1,2,3]},{'x':2,'y':false,'def':[4,5,6]}]}}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).len() == 1);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("1") == true);
    assert(json.child(1).get("b").eq_string("true") == true);
    assert(json.child(1).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(2).len() == 3);
    assert(json.child(2).get("x").eq_string("2") == true);
    assert(json.child(2).get("y").eq_string("false") == true);
    assert(json.child(2).get("def").eq_string("[4,5,6]") == true);
}
