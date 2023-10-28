use dep::rontosoft::JSON;

#[test]
unconstrained
fn property_array_as_value_single_number()
{
    let value = "[1]";
    assert(JSON::parse("{'a':[1]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_single_number_nested()
{
    let value = "[[1]]";
    assert(JSON::parse("{'a':[[1]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple()
{
    let value = "[1,2,3]";
    assert(JSON::parse("{'a':[1,2,3]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_numbers_multiple_nested()
{
    let value = "[[1],[2],[3]]";
    assert(JSON::parse("{'a':[[1],[2],[3]]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_strings()
{
    let value = "['1','2','3']";
    assert(JSON::parse("{'a':['1','2','3']}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_as_value_multiple_mixed_types()
{
    let value = "[1,'2',true]";
    assert(JSON::parse("{'a':[1,'2',true]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_null()
{
    let value = "[null,null]";
    assert(JSON::parse("{'a':[null,null]}").bytesOf("a").unwrap().eq_string(value) == true);
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
fn property_array_one_empty_object()
{
    let value = "[{}]";
    assert(JSON::parse("{'a':[{}]}").bytesOf("a").unwrap().eq_string(value) == true);
}

#[test]
unconstrained
fn property_array_multiple_empty_objects()
{
    let value = "[{},{},{}]";
    assert(JSON::parse("{'a':[{},{},{}]}").bytesOf("a").unwrap().eq_string(value) == true);
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
