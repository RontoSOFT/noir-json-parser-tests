use dep::rontosoft::JSON;

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
    assert(JSON::parse("{'a':[,]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_faulty_colon()
{
    assert(JSON::parse("{'a':[:]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_left_brace_outer()
{
    assert(JSON::parse("{'a':{[]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_right_brace_outer()
{
    assert(JSON::parse("{'a':[]}}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_left_brace_inner()
{
    assert(JSON::parse("{'a':[{]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_right_brace_inner()
{
    assert(JSON::parse("{'a':[}]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_duplicate_left_bracket()
{
    assert(JSON::parse("{'a':[[]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_duplicate_right_bracket()
{
    assert(JSON::parse("{'a':[]]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_empty_nested_values()
{
    assert(JSON::parse("{'a':[[,]]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_empty_nested_missing_missing_value_before()
{
    assert(JSON::parse("{'a':[,[]]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_empty_nested_missing_missing_value_after()
{
    assert(JSON::parse("{'a':[[],]}").bytesOf("a").is_none() == true);
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
    let value = "[{}]";
    assert(JSON::parse("{'a':[{}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_empty_multiple_object()
{
    let value = "[{},{},{}]";
    assert(JSON::parse("{'a':[{},{},{}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_empty_multiple_objects_nested_arrays()
{
    let value = "[[{}],[{}],[{}]]";
    assert(JSON::parse("{'a':[[{}],[{}],[{}]]}").bytesOf("a").unwrap().eq_string(value) == true);
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
    assert(JSON::parse("{'a':[[1,]}").bytesOf("a").is_none() == true);
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
    assert(JSON::parse("{'a':[[1,2,3,]}").bytesOf("a").is_none() == true);
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
    assert(JSON::parse("{'a':[1x]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_number_literal_letter()
{
    assert(JSON::parse("{'a':[1f]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_number_whitespace()
{
    assert(JSON::parse("{'a':[1 2]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_trux()
{
    assert(JSON::parse("{'a':[trux]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_truf()
{
    assert(JSON::parse("{'a':[truf]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_nul()
{
    assert(JSON::parse("{'a':[nul]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_single_literal_wrong_random()
{
    assert(JSON::parse("{'a':[lfseu]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_mixed_types_null_object_array()
{
    let value = "[1,null,'2',true,{},[]]";
    assert(JSON::parse("{'a':[1,null,'2',true,{},[]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_mixed_types_missing_value()
{
    assert(JSON::parse("{'a':[1,,'2',true,{},[]]}").bytesOf("a").is_none() == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property()
{
    let value = "[{'a':1}]";
    assert(JSON::parse("{'a':[{'a':1}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_whitespaces()
{
    let value = "[{'a':1}]";
    assert(JSON::parse("{ 'a' : [ { 'a' : 1 } ] }").bytesOf("a").unwrap().eq_string(value) == true);
    assert(JSON::parse("   {    'a'  :   [  {   'a'   :   1   }     ]     }    ").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_multiple_properties()
{
    let value = "[{'a':1,'b':true,'c':'123'}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'c':'123'}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_multiple_properties()
{
    let value = "[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_array_one_value()
{
    let value = "[{'a':[1]}]";
    assert(JSON::parse("{'a':[{'a':[1]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_array_one_value()
{
    let value = "[{'a':[1]},{'a':[2]}]";
    assert(JSON::parse("{'a':[{'a':[1]},{'a':[2]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_array_multiple_values()
{
    let value = "[{'abc':[1,2,3]}]";
    assert(JSON::parse("{'a':[{'abc':[1,2,3]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_array_multiple_values()
{
    let value = "[{'abc':[1,2,3]},{'abc':[4,5,6]}]";
    assert(JSON::parse("{'a':[{'abc':[1,2,3]},{'abc':[4,5,6]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_with_array_single_value()
{
    let value = "[{'a':1,'b':true,'a':[1]}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'a':[1]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_with_array_single_value()
{
    let value = "[{'a':1,'b':true,'a':[1]},{'a':2,'b':false,'a':[2]}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'a':[1]},{'a':2,'b':false,'a':[2]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_one_object_one_property_with_array_multiple_values()
{
    let value = "[{'a':1,'b':true,'abc':[1,2,3]}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'abc':[1,2,3]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_objects_one_property_with_array_multiple_values()
{
    let value = "[{'a':1,'b':true,'abc':[1,2,3]},{'a':2,'b':false,'a':[4,5,6]}]";
    assert(JSON::parse("{'a':[{'a':1,'b':true,'abc':[1,2,3]},{'a':2,'b':false,'a':[4,5,6]}]}").bytesOf("a").unwrap().eq_string(value) == true);
}
