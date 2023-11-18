use dep::rontosoft::JSON;
use dep::rontosoft::Property;

#[test]
unconstrained
fn value_array_empty()
{
    let json = "[]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_left_bracket()
{
    assert(JSON::parse("[").is_none() == true);
}

#[test]
unconstrained
fn value_array_right_bracket()
{
    assert(JSON::parse("]").is_none() == true);
}

#[test]
unconstrained
fn value_array_left_bracket_and_number()
{
    assert(JSON::parse("[12").is_none() == true);
}

#[test]
unconstrained
fn value_array_right_bracket_and_number()
{
    assert(JSON::parse("12]").is_none() == true);
}

#[test]
unconstrained
fn value_array_left_bracket_and_number_quote()
{
    assert(JSON::parse("[12'").is_none() == true);
}

#[test]
unconstrained
fn value_array_quote_right_bracket_and_number()
{
    assert(JSON::parse("'12]").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_space_empty()
{
    assert(JSON::parse("[] []").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_comma_empty()
{
    assert(JSON::parse("[],[]").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_values()
{
    assert(JSON::parse("[,]").is_none() == true);
}

#[test]
unconstrained
fn value_array_faulty_colon()
{
    assert(JSON::parse("[:]").is_none() == true);
}

#[test]
unconstrained
fn value_array_left_brace_outer()
{
    assert(JSON::parse("{[]").is_none() == true);
}

#[test]
unconstrained
fn value_array_right_brace_outer()
{
    assert(JSON::parse("[]}").is_none() == true);
}

#[test]
unconstrained
fn value_array_left_brace_inner()
{
    assert(JSON::parse("[{]").is_none() == true);
}

#[test]
unconstrained
fn value_array_right_brace_inner()
{
    assert(JSON::parse("[}]").is_none() == true);
}

#[test]
unconstrained
fn value_array_duplicate_left_bracket()
{
    assert(JSON::parse("[[]").is_none() == true);
}

#[test]
unconstrained
fn value_array_duplicate_right_bracket()
{
    assert(JSON::parse("[]]").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_nested_values()
{
    assert(JSON::parse("[[,]]").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_nested_missing_missing_value_before()
{
    assert(JSON::parse("[,[]]").is_none() == true);
}

#[test]
unconstrained
fn value_array_empty_nested_missing_missing_value_after()
{
    assert(JSON::parse("[[],]").is_none() == true);
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
    let json = JSON::parse("[{}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn value_array_empty_multiple_object()
{
    let json = JSON::parse("[{},{},{}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).is_empty() == true);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
}

#[test]
unconstrained
fn value_array_empty_multiple_objects_nested_arrays()
{
    let json = JSON::parse("[[{}],[{}],[{}]]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).is_empty() == true);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
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
    assert(JSON::parse("[1,]").is_none() == true);
}

#[test]
unconstrained
fn value_array_number_faulty_colon()
{
    assert(JSON::parse("[1:]").is_none() == true);
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
    assert(JSON::parse("[1,2,3,]").is_none() == true);
}

#[test]
unconstrained
fn value_array_multiple_numbers_missing_value_space()
{
    assert(JSON::parse("[1,2,3, ]").is_none() == true);
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
fn value_array_null_null()
{
    let json = "[null,null]";
    assert(JSON::parse(json).doc[0].value.eq_string(json) == true);
}

#[test]
unconstrained
fn value_array_single_number_letter()
{
    assert(JSON::parse("[1x]").is_none() == true);
}

#[test]
unconstrained
fn value_array_single_number_literal_letter()
{
    assert(JSON::parse("[1f]").is_none() == true);
}

#[test]
unconstrained
fn value_array_single_literal_wrong_trux()
{
    assert(JSON::parse("[trux]").is_none() == true);
}

#[test]
unconstrained
fn value_array_single_literal_wrong_truf()
{
    assert(JSON::parse("[truf]").is_none() == true);
}

#[test]
unconstrained
fn value_array_single_literal_wrong_nul()
{
    assert(JSON::parse("[nul]").is_none() == true);
}

#[test]
unconstrained
fn value_array_single_literal_wrong_random()
{
    assert(JSON::parse("[lfseu]").is_none() == true);
}

#[test]
unconstrained
fn value_array_literal_faulty_colon()
{
    assert(JSON::parse("[true:]").is_none() == true);
}

#[test]
unconstrained
fn value_array_literal_true_space_true()
{
    assert(JSON::parse("[true true]").is_none() == true);
}

#[test]
unconstrained
fn value_array_number_one_space_two()
{
    assert(JSON::parse("[1 2]}").is_none() == true);
}

#[test]
unconstrained
fn value_array_string_space_string()
{
    assert(JSON::parse("['string' 'string']").is_none() == true);
}

#[test]
unconstrained
fn value_array_array_space_array()
{
    assert(JSON::parse("[[] []]").is_none() == true);
}

#[test]
unconstrained
fn value_array_object_space_object()
{
    assert(JSON::parse("[{} {}]").is_none() == true);
}

#[test]
unconstrained
fn value_array_mixed_types_null_object_array()
{
    let json = JSON::parse("[1,null,'2',true,[],{}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn value_array_mixed_types_missing_value()
{
    assert(JSON::parse("[1,,'2',true,[],{}]").is_none() == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property()
{
    let json = JSON::parse("[{'a':1}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property_whitespaces()
{
    let json = JSON::parse("[ { 'a' : 1 } ]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("1") == true);

    let json = JSON::parse("   [  {   'a'   :   1   }     ] ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn value_array_object_one_multiple_properties()
{
    let json = JSON::parse("[{'a':1,'b':true,'c':'123'}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("'123'") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_multiple_properties()
{
    let json = JSON::parse("[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("'123'") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("2") == true);
    assert(json.child(1).get("b").eq_string("false") == true);
    assert(json.child(1).get("c").eq_string("'456'") == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property_array_one_value()
{
    let json = JSON::parse("[{'a':[1]}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("[1]") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_array_one_value()
{
    let json = JSON::parse("[{'a':[1]},{'b':[2]}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("[1]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("b").eq_string("[2]") == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property_array_multiple_values()
{
    let json = JSON::parse("{'a':[{'abc':[1,2,3]}]}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_array_multiple_values()
{
    let json = JSON::parse("[{'abc':[1,2,3]},{'def':[4,5,6]}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("def").eq_string("[4,5,6]") == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property_with_array_single_value()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':[1]}]}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("[1]") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_with_array_single_value()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':[1]},{'a':2,'b':false,'c':[2]}]}");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("[1]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("2") == true);
    assert(json.child(1).get("b").eq_string("false") == true);
    assert(json.child(1).get("c").eq_string("[2]") == true);
}

#[test]
unconstrained
fn value_array_object_one_one_property_with_array_multiple_values()
{
    let json = JSON::parse("[{'a':1,'b':true,'abc':[1,2,3]}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn value_array_multiple_objects_one_property_with_array_multiple_values()
{
    let json = JSON::parse("[{'a':1,'b':true,'abc':[1,2,3]},{'x':2,'y':false,'def':[4,5,6]}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("x").eq_string("2") == true);
    assert(json.child(1).get("y").eq_string("false") == true);
    assert(json.child(1).get("def").eq_string("[4,5,6]") == true);
}
