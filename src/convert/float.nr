use dep::std::option::Option;

use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::PLUS;
use dep::rontosoft::globals::DECIMAL_POINT;
use dep::rontosoft::globals::eE;
use dep::rontosoft::JSON;
use dep::rontosoft::convert::asFloat;

// #[test]
// unconstrained
// fn float_test_precision_max_bits_fraction()
// {
//     // 0.45zeros anything after is not representable
//     // 2^(-128) == 2^(-128) - 0.[..]1
//     // 2^(-128) - 0.[..]2
// }

// #[test]
// unconstrained
// fn float_test_precision_twenty_five_bits_fraction()
// {
//     // 2^(-2)

//     // dep::std::println("0.0000000298023223876953125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 298023223876953125, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(19);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 2980232238769531);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("0.00000002980232238769531259");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 2980232238769531259, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(19);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 2980232238769531);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("0.00000002980232238769532");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 2980232238769532, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(19);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 2980232238769531);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("0.000000029802321499516891146"); 298023223876953125
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 2980232238769530, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(19);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 2980232061133847);
//     assert(y.leading_zeros == x.leading_zeros);
// }

// #[test]
// unconstrained
// fn float_test_precision_twenty_four_bits_fraction()
// {
//     // 2^(-1)
//     // from this point until lowerend, whole part cannot be represented

//     // dep::std::println("0.000000059604644775390625");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 59604644775390625, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 5960464477539062);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("1.000000059604644775390625");
//     let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 59604644775390625, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 0);
//     assert(y.leading_zeros == 0);

//     // dep::std::println("0.0000000596046447753906259");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 596046447753906259, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 5960464477539062);
//     assert(y.leading_zeros == x.leading_zeros);
// }

// #[test]
// unconstrained
// fn float_test_precision_twenty_three_bits_fraction_one_bit_whole()
// {
//     // 2^0
//     // whole part can be either 1 or 0

//     // dep::std::println("0.00000011920928955078125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 11920928955078125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("1.00000011920928955078125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 11920928955078125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("2.00000011920928955078125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 11920928955078125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 0);
//     assert(y.leading_zeros == 0);

//     // dep::std::println("1.000000119209289550781259");
//     let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 119209289550781259, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(18);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 11920928955078125);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_test_precision_twenty_two_bits_fraction_one_bit_whole()
{
    // 2^1
    // whole part can be either 3 or 2

    // dep::std::println("2.0000001192092897728258"); // end of 0 mantissa
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 1192092897728258, leading_zeros: 6 };
    let y = x.toFloat32().toFields(20);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    // dep::std::println("2.0000001192092897728259"); // start of 1 mantissa
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 1192092897728259, leading_zeros: 6 };
    let y = x.toFloat32().toFields(20);

    assert(y.whole == x.whole);
    assert(y.fraction == 2384185791015625); // 2^(-22)
    assert(y.leading_zeros == x.leading_zeros);

    // // dep::std::println("2.0000002384185791015625");
    // let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 2384185791015625, leading_zeros: 6 };
    // let y = x.toFloat32().toFields(16);

    // assert(y.whole == x.whole);
    // assert(y.fraction == x.fraction);
    // assert(y.leading_zeros == x.leading_zeros);

    // // dep::std::println("3.0000002384185791015625");
    // let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 2384185791015625, leading_zeros: 6 };
    // let y = x.toFloat32().toFields(16);

    // assert(y.whole == x.whole);
    // assert(y.fraction == x.fraction);
    // assert(y.leading_zeros == x.leading_zeros);

    // // dep::std::println("2.00000023841857910156259");
    // let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 23841857910156259, leading_zeros: 6 };
    // let y = x.toFloat32().toFields(16);

    // assert(y.whole == x.whole);
    // assert(y.fraction == 2384185791015625);
    // assert(y.leading_zeros == x.leading_zeros);

    // // dep::std::println("4.0000002384185791015625");
    // let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 2384185791015625, leading_zeros: 6 };
    // let y = x.toFloat32().toFields(16);

    // assert(y.whole == x.whole);
    // assert(y.fraction == 0);
    // assert(y.leading_zeros == 0);

    // // dep::std::println("4.000000476837158203125");
    // let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 476837158203125, leading_zeros: 6 };
    // let y = x.toFloat32().toFields(16);

    // assert(y.whole == x.whole);
    // assert(y.fraction == 0);
    // assert(y.leading_zeros == 0);
}

// #[test]
// unconstrained
// fn float_test_precision_twenty_one_bits_fraction_two_bits_whole()
// {
//     // 2^2
//     // from this point until 2^1, four values can be used to represent whole part

//     // dep::std::println("4.000000476837158203125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 476837158203125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(16);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("6.000000476837158203125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 476837158203125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(16);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == x.leading_zeros);

//     // dep::std::println("8.000000476837158203125");
//     let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 476837158203125, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(16);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 0);
//     assert(y.leading_zeros == 0);

//     // dep::std::println("4.0000004768371582031259");
//     let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 4768371582031259, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(16);

//     assert(y.whole == x.whole);
//     assert(y.fraction == 476837158203125);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_test_precision_two_bits_fraction_twenty_one_bits_whole()
{
    // 2^22
    // from this point until 2^23, four values can be used to represent fractional part

    // test less than interval

    let x = dep::rontosoft::float::Float32Fields { whole: 2097151, fraction: 82, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097151.82");
    assert(y.whole == x.whole);
    assert(y.fraction == 9);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097151, fraction: 93, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097151.93");
    assert(y.whole == x.whole);
    assert(y.fraction == 9);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097151, fraction: 94, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.94");
    assert(y.whole == 2097152);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 12, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.13");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 13, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.11");
    assert(y.whole == x.whole);
    assert(y.fraction == 3);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 37, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.37");
    assert(y.whole == x.whole);
    assert(y.fraction == 3);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 38, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.38");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 62, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.62");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 2097152, fraction: 63, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("2097152.63");
    assert(y.whole == x.whole);
    assert(y.fraction == 8);
}

#[test]
unconstrained
fn float_test_precision_one_bit_fraction_twenty_three_bits_whole()
{
    // 2^23
    // from this point until 2^24, two values can be used to represent fractional part

    // test less than interval

    // 2^23 - 1 .7
    let x = dep::rontosoft::float::Float32Fields { whole: 4194303, fraction: 7, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194303.7");
    assert(y.whole == x.whole);
    assert(y.fraction == 8);
    assert(y.leading_zeros == x.leading_zeros);

    // 2^23 - 1 .8
    let x = dep::rontosoft::float::Float32Fields { whole: 4194303, fraction: 8, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194303.8");
    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);

    // loss of precision starts here, due to rounding up

    // 2^23 - 1 .9
    let x = dep::rontosoft::float::Float32Fields { whole: 4194303, fraction: 9, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194303.9");
    assert(y.whole == 4194304);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 1, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.01");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 9, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.09");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 25, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.25");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 26, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.26");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);
    assert(y.leading_zeros == 0);

    // test interval

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.0");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 1, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.1");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 2, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.2");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 3, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.3");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 4, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.4");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.5");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 6, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.6");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 7, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.7");
    assert(y.whole == x.whole);
    assert(y.fraction == 5);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 8, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.8");
    assert(y.whole == 4194305);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194304, fraction: 9, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194304.9");
    assert(y.whole == 4194305);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 4194305, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("4194305.0");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
}

#[test]
unconstrained
fn float_test_precision__zero_bit_fraction_twenty_three_bits_whole()
{
    // 2^23
    // from this point until higher end, fraction part cannot be represented

    // test less than interval

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 11, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.01");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 9, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.09");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 91, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.91");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == x.leading_zeros);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 99, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.99");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == x.leading_zeros);

    // test interval

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.0");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 1, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.1");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 2, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.2");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 3, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.3");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 4, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.4");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.5");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 6, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.6");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 7, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.7");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 8, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.8");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388608, fraction: 9, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388608.9");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 8388609, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("8388609.0");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);
}

#[test]
unconstrained
fn float_test_precision_twenty_four_bits_whole()
{
    // 2^24 - 2
    let x = dep::rontosoft::float::Float32Fields { whole: 16777214, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^24 - 1
    let x = dep::rontosoft::float::Float32Fields { whole: 16777215, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // precision loss after this point: 1 byte

    // 2^24
    let x = dep::rontosoft::float::Float32Fields { whole: 16777216, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^24 + 1
    let x = dep::rontosoft::float::Float32Fields { whole: 16777217, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 16777216);
    assert(y.fraction == 0);

    // 2^24 + 2
    let x = dep::rontosoft::float::Float32Fields { whole: 16777218, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^24 + 3
    let x = dep::rontosoft::float::Float32Fields { whole: 16777219, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 16777218);
    assert(y.fraction == 0);

    // 2^24 + 4
    let x = dep::rontosoft::float::Float32Fields { whole: 16777220, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // .. //

    // 2^24 + 2^23 - 2
    let x = dep::rontosoft::float::Float32Fields { whole: 25165822, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^24 + 2^23 - 1
    let x = dep::rontosoft::float::Float32Fields { whole: 25165823, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 25165822);
    assert(y.fraction == 0);

    // 2^24 + 2^23
    let x = dep::rontosoft::float::Float32Fields { whole: 25165824, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^24 + 2^23 + 1
    let x = dep::rontosoft::float::Float32Fields { whole: 25165825, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 25165824);
    assert(y.fraction == 0);

    // 2^24 + 2^23 + 2
    let x = dep::rontosoft::float::Float32Fields { whole: 25165826, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
}

#[test]
unconstrained
fn float_test_precision_twenty_five_bits_whole()
{
    // 2^25 - 2
    let x = dep::rontosoft::float::Float32Fields { whole: 33554430, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554430");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^25 - 1
    let x = dep::rontosoft::float::Float32Fields { whole: 33554431, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554431");
    assert(y.whole == 33554430);
    assert(y.fraction == 0);

    // precision loss after this point: 2 bytes

    // 2^25
    let x = dep::rontosoft::float::Float32Fields { whole: 33554432, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554432");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^25 + 1
    let x = dep::rontosoft::float::Float32Fields { whole: 33554433, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554433");
    assert(y.whole == 33554432);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554434, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554434");
    assert(y.whole == 33554432);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554435, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554435");
    assert(y.whole == 33554432);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554436, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554436");
    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554437, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554437");
    assert(y.whole == 33554436);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554438, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554438");
    assert(y.whole == 33554436);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 33554439, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    // dep::std::println("33554439");
    assert(y.whole == 33554436);
    assert(y.fraction == 0);
}

#[test]
unconstrained
fn float_test_precision_twenty_six_bits_whole()
{
    // 2 ^ 26 - 2
    let x = dep::rontosoft::float::Float32Fields { whole: 67108862, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108860);
    assert(y.fraction == 0);

    // 2 ^ 26 - 1
    let x = dep::rontosoft::float::Float32Fields { whole: 67108863, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108860);
    assert(y.fraction == 0);

    // precision loss after this point: 3 bytes

    // 2 ^ 26
    let x = dep::rontosoft::float::Float32Fields { whole: 67108864, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2 ^ 26 + 1
    let x = dep::rontosoft::float::Float32Fields { whole: 67108865, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 2
    let x = dep::rontosoft::float::Float32Fields { whole: 67108866, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 3
    let x = dep::rontosoft::float::Float32Fields { whole: 67108867, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 4
    let x = dep::rontosoft::float::Float32Fields { whole: 67108868, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 5
    let x = dep::rontosoft::float::Float32Fields { whole: 67108869, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 6
    let x = dep::rontosoft::float::Float32Fields { whole: 67108870, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    // 2 ^ 26 + 7
    let x = dep::rontosoft::float::Float32Fields { whole: 67108871, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 67108864);
    assert(y.fraction == 0);

    let x = dep::rontosoft::float::Float32Fields { whole: 67108872, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
}

#[test]
unconstrained
fn float_test_precision_max_bits_whole()
{
    // 2^126
    let x = dep::rontosoft::float::Float32Fields { whole: 42535295865117307932921825928971026432, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^127
    let x = dep::rontosoft::float::Float32Fields { whole: 85070591730234615865843651857942052864, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^128 - 1
    let x = dep::rontosoft::float::Float32Fields { whole: 170141183460469231731687303715884105727, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);

    // 2^128
    let x = dep::rontosoft::float::Float32Fields { whole: 170141183460469231731687303715884105728, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == 0);
    assert(y.fraction == 0);
}

///

#[test]
unconstrained
fn float_zero()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_two()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_three()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_four()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_six()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_seven()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_eight_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 1);
    assert(y.leading_zeros == y.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(x.whole == y.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_minus_one()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_minus_two()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_minus_three()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

#[test]
unconstrained
fn float_minus_four()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 0, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == 0);
    assert(y.leading_zeros == 0);
}

// #[test]
// unconstrained
// fn convert_bytes_array_as_float()
// {
    // dep::std::println("");
    // let bytes = [ 0x31, DECIMAL_POINT, 0x35, 0x35 ];
    // let tuple = asFloat(bytes);

    // assert(tuple.0.is_some() == true);
    // assert(tuple.0.unwrap_unchecked() == 101);
    // assert(tuple.1.is_some() == true);
    // assert(tuple.1.unwrap_unchecked() == 234);


    // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 1).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 2).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 3).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 5).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 2).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 3).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(2, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(4, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(5, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(6, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(7, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(8, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(9, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(10, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(11, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(12, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(13, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(14, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(15, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(16, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(17, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(18, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(31, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(32, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(33, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(34, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(63, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(64, 55, 0).toFields(1));

    // dep::std::println(dep::rontosoft::float::toFloat32(85, 125, 1).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(13, 26, 0).toFields(1));

    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 1).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 2).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 3).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 4).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 5).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 6).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 7).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 1).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 2).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 3).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 4).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 5).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 6).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 7).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(2, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(4, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(8, 55, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(85, 125, 0).toFields(1));
    // dep::std::println(dep::rontosoft::float::toFloat32(13, 26, 0).toFields(1));
// }

        // dep::std::println(f"iterations: {iterations}");
        // dep::std::println(f"value_exponent: {value_exponent}");
        // dep::std::println(f"pre_num: {pre_num}");
        // dep::std::println(f"numerator: {numerator}");
        // dep::std::println(f"ten: {ten}");
        // dep::std::println(f"whole: {whole}");
