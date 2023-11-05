use dep::rontosoft::JSON;
use dep::rontosoft::Property;

use crate::utils::object_one;
use crate::utils::array_object_one;
use crate::utils::array_object_one_two;

#[test]
unconstrained
fn property_array_empty()
{
    let value = "[]";
    assert(JSON::parse("{'a':[]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_empty_values()
{
    assert(JSON::parse("{'a':[,]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_faulty_colon()
{
    assert(JSON::parse("{'a':[:]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_left_brace_outer()
{
    assert(JSON::parse("{'a':{[]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_right_brace_outer()
{
    assert(JSON::parse("{'a':[]}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_left_brace_inner()
{
    assert(JSON::parse("{'a':[{]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_right_brace_inner()
{
    assert(JSON::parse("{'a':[}]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_duplicate_left_bracket()
{
    assert(JSON::parse("{'a':[[]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_duplicate_right_bracket()
{
    assert(JSON::parse("{'a':[]]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_empty_nested_values()
{
    assert(JSON::parse("{'a':[[,]]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_empty_nested_missing_missing_value_before()
{
    assert(JSON::parse("{'a':[,[]]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_empty_nested_missing_missing_value_after()
{
    assert(JSON::parse("{'a':[[],]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_empty_nested()
{
    let value = "[[]]";
    assert(JSON::parse("{'a':[[]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_empty_nested()
{
    let value = "[[],[],[]]";
    assert(JSON::parse("{'a':[[],[],[]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_empty_object()
{
    let json = JSON::parse("{'a':[{}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);
    assert(json.child(0).is_empty_object());
}

#[test]
unconstrained
fn property_array_empty_multiple_objects()
{
    let json = JSON::parse("{'a':[{},{},{}]}");

    assert(json.doc.len() == 1);

    let mut value = "[{1},{2},{3}]".as_bytes();
    value[2] = 0;
    value[6] = 1;
    value[10] = 2;
    assert(json.bytesOf("a").unwrap().eq_array(value) == true);

    assert(json.children.len() == 3);
    assert(json.child(0).is_empty_object());
    assert(json.child(1).is_empty_object());
    assert(json.child(2).is_empty_object());
}

#[test]
unconstrained
fn property_array_empty_multiple_objects_nested_arrays()
{
    let json = JSON::parse("{'a':[[{}],[{}],[{}]]}");

    assert(json.doc.len() == 1);

    let mut value = "[[{1}],[{2}],[{3}]]".as_bytes();
    value[3] = 0;
    value[9] = 1;
    value[15] = 2;
    assert(json.bytesOf("a").unwrap().eq_array(value) == true);

    assert(json.children.len() == 3);
    assert(json.child(0).is_empty_object());
    assert(json.child(1).is_empty_object());
    assert(json.child(2).is_empty_object());
}

#[test]
unconstrained
fn property_array_single_number()
{
    let value = "[1]";
    assert(JSON::parse("{'a':[1]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_single_number_missing_value()
{
    assert(JSON::parse("{'a':[[1,]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_number_faulty_colon()
{
    assert(JSON::parse("{'a':[1:]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_numbers_multiple()
{
    let value = "[1,2,3]";
    assert(JSON::parse("{'a':[1,2,3]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_numbers_missing_value()
{
    assert(JSON::parse("{'a':[[1,2,3,]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_number_nested()
{
    let value = "[[1]]";
    assert(JSON::parse("{'a':[[1]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_numbers_multiple_nested()
{
    let value = "[[1],[2],[3]]";
    assert(JSON::parse("{'a':[[1],[2],[3]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_array_numbers_nested()
{
    let value = "[[1,1],[2,2],[3,3]]";
    assert(JSON::parse("{'a':[[1,1],[2,2],[3,3]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_empty_string()
{
    let value = "['']";
    assert(JSON::parse("{'a':['']}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_empty_strings()
{
    let value = "['','','']";
    assert(JSON::parse("{'a':['','','']}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_strings()
{
    let value = "['1','2','3']";
    assert(JSON::parse("{'a':['1','2','3']}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_mixed_types()
{
    let value = "[1,'2',true]";
    assert(JSON::parse("{'a':[1,'2',true]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_null_null()
{
    let value = "[null,null]";
    assert(JSON::parse("{'a':[null,null]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_single_number_letter()
{
    assert(JSON::parse("{'a':[1x]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_number_literal_letter()
{
    assert(JSON::parse("{'a':[1f]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_number_whitespace()
{
    assert(JSON::parse("{'a':[1 2]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_trux()
{
    assert(JSON::parse("{'a':[trux]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_truf()
{
    assert(JSON::parse("{'a':[truf]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_nul()
{
    assert(JSON::parse("{'a':[nul]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_random()
{
    assert(JSON::parse("{'a':[lfseu]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_literal_faulty_colon()
{
    assert(JSON::parse("{'a':[true:]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_mixed_types_null_object_array()
{
    let json = JSON::parse("{'a':[1,null,'2',true,[],{}]}");

    assert(json.doc.len() == 1);

    let mut value = "[1,null,'2',true,[],{1}]".as_bytes();
    value[21] = 0;
    assert(json.bytesOf("a").unwrap().eq_array(value) == true);

    assert(json.children.len() == 1);
    assert(json.child(0).is_empty_object());
}

#[test]
unconstrained
fn property_array_mixed_types_missing_value()
{
    assert(JSON::parse("{'a':[1,,'2',true,[],{}]}").doc.len() == 0);
}

#[test]
unconstrained
fn property_array_one_object_one_property()
{
    let json = JSON::parse("{'a':[{'b':1}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("1") == true);

    // assert(json.doc.len() == 2);

    // ///
    // let value_a = json.getSlice("a").unwrap();
    // assert(value_a.len() == 1);
    // assert(value_a[0].eq_array(object_one) == true);

    // assert(json.getChild(value_a[0][1]).bytesOf("b").unwrap().eq_string("1") == true);
    // // or
    // assert(value_a[0].asObject(json).unwrap().bytesOf("b").unwrap().eq_string("1") == true);
    // ///

    // let obj_1 = json.doc[0].getSlice("a").unwrap()[0].asObject(json).unwrap();
    // assert(obj_1.bytesOf("b").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_whitespaces()
{
    let json = JSON::parse("{ 'a' : [ { 'b' : 1 } ] }");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("1") == true);

    let json = JSON::parse("   {    'a'  :   [  {   'b'   :   1   }     ]     }    ");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn property_array_object_one_multiple_properties()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':'123'}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("c").unwrap().eq_string("'123'") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_multiple_properties()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one_two) == true);

    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("c").unwrap().eq_string("'123'") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).bytesOf("a").unwrap().eq_string("2") == true);
    assert(json.child(1).bytesOf("b").unwrap().eq_string("false") == true);
    assert(json.child(1).bytesOf("c").unwrap().eq_string("'456'") == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_array_one_value()
{
    let json = JSON::parse("{'a':[{'a':[1]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("[1]") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_array_one_value()
{
    let json = JSON::parse("{'a':[{'a':[1]},{'b':[2]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one_two) == true);

    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("[1]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).bytesOf("b").unwrap().eq_string("[2]") == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_array_multiple_values()
{
    let json = JSON::parse("{'a':[{'abc':[1,2,3]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("abc").unwrap().eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_array_multiple_values()
{
    let json = JSON::parse("{'a':[{'abc':[1,2,3]},{'def':[4,5,6]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one_two) == true);

    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).bytesOf("abc").unwrap().eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).bytesOf("def").unwrap().eq_string("[4,5,6]") == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_with_array_single_value()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':[1]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("c").unwrap().eq_string("[1]") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_with_array_single_value()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'c':[1]},{'a':2,'b':false,'c':[2]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one_two) == true);

    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("c").unwrap().eq_string("[1]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).bytesOf("a").unwrap().eq_string("2") == true);
    assert(json.child(1).bytesOf("b").unwrap().eq_string("false") == true);
    assert(json.child(1).bytesOf("c").unwrap().eq_string("[2]") == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_with_array_multiple_values()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'abc':[1,2,3]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one) == true);

    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("abc").unwrap().eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_with_array_multiple_values()
{
    let json = JSON::parse("{'a':[{'a':1,'b':true,'abc':[1,2,3]},{'x':2,'y':false,'def':[4,5,6]}]}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(array_object_one_two) == true);

    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).bytesOf("a").unwrap().eq_string("1") == true);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("true") == true);
    assert(json.child(0).bytesOf("abc").unwrap().eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).bytesOf("x").unwrap().eq_string("2") == true);
    assert(json.child(1).bytesOf("y").unwrap().eq_string("false") == true);
    assert(json.child(1).bytesOf("def").unwrap().eq_string("[4,5,6]") == true);
}
